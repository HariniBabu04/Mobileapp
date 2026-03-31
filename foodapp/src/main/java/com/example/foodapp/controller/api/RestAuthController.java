package com.example.foodapp.controller.api;

import com.example.foodapp.model.User;
import com.example.foodapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class RestAuthController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, String> credentials) {
        String email = credentials.get("email");
        String password = credentials.get("password");
        String role = credentials.get("role");

        User user = userService.authenticateUser(email, password);

        if (user != null && user.getRole().equalsIgnoreCase(role)) {
            Map<String, Object> response = new HashMap<>();
            response.put("status", "success");
            response.put("user", user);
            return ResponseEntity.ok(response);
        }

        Map<String, String> error = new HashMap<>();
        error.put("status", "error");
        error.put("message", "Invalid credentials or role");
        return ResponseEntity.status(401).body(error);
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody User user) {
        boolean status = userService.registerUser(user);
        Map<String, String> response = new HashMap<>();
        if (status) {
            response.put("status", "success");
            response.put("message", "User registered successfully");
            return ResponseEntity.ok(response);
        } else {
            response.put("status", "error");
            response.put("message", "Email already exists");
            return ResponseEntity.badRequest().body(response);
        }
    }
}
