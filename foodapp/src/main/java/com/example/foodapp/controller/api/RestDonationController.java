package com.example.foodapp.controller.api;

import com.example.foodapp.model.Donation;
import com.example.foodapp.model.User;
import com.example.foodapp.service.DonationService;
import com.example.foodapp.service.UserService;
import com.example.foodapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/food")
@CrossOrigin(origins = "*")
public class RestDonationController {

    @Autowired
    private DonationService donationService;

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/add")
    public ResponseEntity<?> addDonation(@RequestBody Map<String, Object> donationData) {
        try {
            Integer donorId = (Integer) donationData.get("donorId");
            User donor = userRepository.findById(donorId).orElse(null);
            
            if (donor == null) {
                return ResponseEntity.badRequest().body("Donor not found");
            }

            Donation donation = new Donation();
            donation.setFoodName((String) donationData.get("foodName"));
            donation.setFoodType((String) donationData.get("foodType"));
            donation.setQuantity((Integer) donationData.get("quantity"));
            donation.setPickupAddress((String) donationData.get("pickupAddress"));
            donation.setContactPerson((String) donationData.get("contactPerson"));
            donation.setContactNumber((String) donationData.get("contactNumber"));
            donation.setDonor(donor);
            donation.setStatus("CREATED");

            donationService.saveDonation(donation);
            return ResponseEntity.ok(Map.of("status", "success", "message", "Donation posted successfully"));
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }

    @GetMapping("/available")
    public ResponseEntity<List<Donation>> getAvailableFood() {
        return ResponseEntity.ok(donationService.getDonationsByStatus("CREATED"));
    }

    @PostMapping("/accept/{id}")
    public ResponseEntity<?> acceptDonation(@PathVariable Integer id, @RequestBody Map<String, Integer> data) {
        Integer ngoId = data.get("ngoId");
        User ngo = userRepository.findById(ngoId).orElse(null);
        
        if (ngo == null) {
            return ResponseEntity.badRequest().body("Seeker/NGO not found");
        }

        donationService.acceptDonation(id, ngo);
        return ResponseEntity.ok(Map.of("status", "success", "message", "Donation accepted"));
    }

    @GetMapping("/donor/{id}")
    public ResponseEntity<List<Donation>> getDonorDonations(@PathVariable Integer id) {
        User donor = userRepository.findById(id).orElse(null);
        if (donor == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(donationService.getDonationsByDonor(donor));
    }
}
