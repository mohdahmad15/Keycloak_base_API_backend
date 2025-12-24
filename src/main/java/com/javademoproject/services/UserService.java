package com.javademoproject.services;

import com.javademoproject.entity.UserEntity;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface UserService {
    public ResponseEntity<?> register(UserEntity user);

    public List<UserEntity> getAllUsers();

    public UserEntity getUserById(Long id);
}