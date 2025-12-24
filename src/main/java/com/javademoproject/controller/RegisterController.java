package com.javademoproject.controller;

import com.javademoproject.entity.UserEntity;
import com.javademoproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/userApi")
@CrossOrigin(origins = "http://localhost:3000")
public class RegisterController {

    @Autowired
    UserService userService;
    @PostMapping("/register")
    public ResponseEntity<?> registerUser(@RequestBody UserEntity user) {
        System.out.println("Request Received:"+user);
        return userService.register(user);
    }
}
