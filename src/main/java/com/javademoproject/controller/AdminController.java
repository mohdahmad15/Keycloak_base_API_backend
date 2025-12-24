package com.javademoproject.controller;

import com.javademoproject.entity.UserEntity;
import com.javademoproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/admin")
public class AdminController {

    @Autowired
    UserService userService;

    @GetMapping("/userdtls")
    public List<UserEntity> getAllUserDetails() {
        return userService.getAllUsers();
    }
}
