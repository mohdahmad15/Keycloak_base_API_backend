package com.javademoproject.services;

import com.javademoproject.entity.UserEntity;
import com.javademoproject.repository.UserRepo;
import jakarta.ws.rs.core.Response;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.resource.RealmResource;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.keycloak.representations.idm.RoleRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;


import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

   @Autowired
    UserRepo userRepo;
    @Autowired
    MailSendToUserService mailSendtoUser;
    @Autowired
    Keycloak keycloak;

    @Value("${keycloak.user.realm}")
    private String realmUser;
    @Override
    public ResponseEntity<?> register(UserEntity user) {
        System.out.println("Register User"+ LocalDateTime.now());
        try{
            if(user.getEmail()==null||user.getPassword()==null||user.getRole()==null||user.getMobileNumber()==null){
                return ResponseEntity.badRequest().body("Email, Password, User Name and role are required.");
            }

            if (user.getFirstName() == null || user.getLastName() == null) {
                throw new RuntimeException("First name and Last name are mandatory");
            }
            RealmResource realm=keycloak.realm(realmUser);
            UsersResource usersResource=realm.users();
            UserRepresentation kcUser=new UserRepresentation();
            kcUser.setUsername(user.getUserName());
            kcUser.setFirstName(user.getFirstName());
            kcUser.setLastName(user.getLastName());
            kcUser.setEmail(user.getEmail());
            kcUser.setEnabled(true);
            kcUser.setEmailVerified(true);
            Response response = usersResource.create(kcUser);
            System.out.println("Response status:"+response.getStatus());
            if (response.getStatus() !=201){
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body("User creation failed in Keycloak");
            }

            String keycloakUserId = response.getLocation().getPath().replaceAll(".*/([^/]+)$", "$1");

            //Set Password in Keycloak
            CredentialRepresentation credential=new CredentialRepresentation();
            credential.setType(CredentialRepresentation.PASSWORD);
            credential.setValue(user.getPassword());
            credential.setTemporary(false);

            usersResource.get(keycloakUserId).resetPassword(credential);
            //Assign Role user
            try{
                //RoleRepresentation role=realm.roles().get("USER").toRepresentation();
                String roleName=user.getRole().toUpperCase();
                RoleRepresentation role=realm
                        .roles()
                        .get(roleName)
                        .toRepresentation();

                usersResource.get(keycloakUserId)
                        .roles()
                        .realmLevel()
                        .add(Collections.singletonList(role));
            }
            catch(Exception e){
                throw new RuntimeException("Invalid role: " + user.getRole());
            }

            //save user in DB
            user.setKeycloakUserId(keycloakUserId);
            UserEntity save = userRepo.save(user);
            String toEmail = save.getEmail();
            String body ="Hello " + save.getUserName()+",\n\n"
                    + ",\n\nYou have been registered successfully.\n"
                    + "Your email: " + save.getEmail() + "\n"
                    + "Your Mobile: " + save.getMobileNumber() + "\n\n"
                    + "Thank you!";
            String subject = "User Registration Alert!";

            String mailresponse = mailSendtoUser.sendMailToUser(toEmail, subject, body);

            return ResponseEntity.ok().body("User registered successfully: Details sent on mail"+mailresponse);
        }
        catch(Exception e){
            System.out.println("Error in registering User"+ e.getStackTrace());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error:"+e.getMessage());
        }

    }

    @Override
    public List<UserEntity> getAllUsers() {

       List<UserEntity> user = userRepo.findAll();

        return user;
    }

    @Override
    public UserEntity getUserById(Long id) {
        if(userRepo.findById(id).isPresent()){
            return userRepo.findById(id).get();
        }
        else {
            return null;
        }
    }
}
