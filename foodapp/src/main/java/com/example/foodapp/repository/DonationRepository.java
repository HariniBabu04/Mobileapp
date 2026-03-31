package com.example.foodapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.foodapp.model.Donation;
import com.example.foodapp.model.User;
import java.util.List;

public interface DonationRepository extends JpaRepository<Donation, Integer> {
    List<Donation> findByStatus(String status);
    List<Donation> findByNgo(User ngo);
    List<Donation> findByDonor(User donor);
    List<Donation> findByStatusAndNgo(String status, User ngo);
}