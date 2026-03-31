package com.example.foodapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.foodapp.model.Donation;
import com.example.foodapp.model.User;
import com.example.foodapp.repository.DonationRepository;
import com.example.foodapp.repository.NotificationRepository;
import com.example.foodapp.model.Notification;
import java.util.List;
import java.util.Optional;

@Service
public class DonationService {

    @Autowired
    private DonationRepository donationRepo;

    @Autowired
    private NotificationRepository notificationRepo;

    public void saveDonation(Donation donation) {
        donationRepo.save(donation);
    }

    public List<Donation> getDonationsByStatus(String status) {
        return donationRepo.findByStatus(status);
    }

    public List<Donation> getDonationsByDonor(User donor) {
        return donationRepo.findByDonor(donor);
    }

    public Optional<Donation> getDonationById(Integer id) {
        return donationRepo.findById(id);
    }

    public void acceptDonation(Integer donationId, User ngo) {
        Optional<Donation> donationOpt = donationRepo.findById(donationId);
        if (donationOpt.isPresent()) {
            Donation donation = donationOpt.get();
            donation.setStatus("ACCEPTED");
            donation.setNgo(ngo);
            donationRepo.save(donation);
            
            // Phase 5: Create Notification for Donor
            Notification notification = new Notification(
                "Your donation '" + donation.getFoodName() + "' has been accepted by " + ngo.getOrganizationName(),
                donation.getDonor()
            );
            notificationRepo.save(notification);
        }
    }

    public List<Donation> getDonationsByNgo(User ngo) {
        return donationRepo.findByNgo(ngo);
    }

    public List<Donation> getDonationsByStatusAndNgo(String status, User ngo) {
        return donationRepo.findByStatusAndNgo(status, ngo);
    }
}