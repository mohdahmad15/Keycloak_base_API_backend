package com.javademoproject.services;

import com.javademoproject.dto.KeycloakTokenResponse;
import com.javademoproject.dto.LoginRequest;
import com.javademoproject.dto.LoginResponse;
import com.javademoproject.repository.LoginRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Service
public class LoginService {

    private final String TOKEN_URL = "http://localhost:8080/realms/user-realm/protocol/openid-connect/token";
    private final String CLIENT_ID = "user-service";
    private final String CLIENT_SECRET = "dqd3I4zUPhbrepAXdYxreBMo9FZaC755";

    public LoginResponse login(LoginRequest loginRequest) {

        RestTemplate restTemplate = new RestTemplate();
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("grant_type","password");
        body.add("client_id",CLIENT_ID);
        body.add("client_secret", CLIENT_SECRET);
        body.add("username",loginRequest.getUsername());
        body.add("password",loginRequest.getPassword());

        System.out.println("loginRequest:"+loginRequest);
    //Set header
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.setAccept(List.of(MediaType.APPLICATION_JSON));
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);
        ResponseEntity<KeycloakTokenResponse> response = restTemplate.postForEntity(TOKEN_URL, request, KeycloakTokenResponse.class);
        System.out.println("loginResponse:"+response);
        if (!response.getStatusCode().is2xxSuccessful() || response.getBody() == null) {
            throw new RuntimeException("Invalid username or password");
        }
        KeycloakTokenResponse logRep = response.getBody();
        return new LoginResponse(logRep.getAccessToken(),logRep.getRefreshToken(),logRep.getExpiresIn());
    }
}
