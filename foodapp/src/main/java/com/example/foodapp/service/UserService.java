package com.example.foodapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.foodapp.model.User;
import com.example.foodapp.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository repo;

    private final org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder passwordEncoder = new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder();

    // LOGIN
    public User authenticateUser(String email, String password) {

        User existingUser = repo.findByEmail(email);

        if (existingUser != null && passwordEncoder.matches(password, existingUser.getPassword())) {
            return existingUser;
        }

        return null;
    }

    // REGISTER

    public boolean registerUser(User user) {

        // check email first
        User existingUser = repo.findByEmail(user.getEmail());

        if (existingUser != null) {
            return false;   // duplicate email
        }

        // Encrypt password before saving
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        repo.save(user);
        return true;
    }
}


