package com.javademoproject.controller;

import com.javademoproject.entity.UserEntity;
import com.javademoproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    UserService userService;
    @GetMapping("/userById/{id}")
    public UserEntity userById(@PathVariable Long id) {
        return userService.getUserById(id);
    }
}