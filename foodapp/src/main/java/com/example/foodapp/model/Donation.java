package com.example.foodapp.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "donations")
public class Donation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer donationId;

    private String foodName;
    private String foodType;
    private Integer quantity;

    private LocalDate preparedDate;
    private LocalTime preparedTime;
    private LocalTime expiryTime;

    private String pickupAddress;

    private String contactPerson;
    private String contactNumber;

    private String status = "CREATED"; // CREATED, ACCEPTED, PICKED_UP, COMPLETED, EXPIRED

    @ManyToOne
    @JoinColumn(name = "ngo_id")
    private User ngo;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User donor;

    public Donation() {}

    public Integer getDonationId() {
        return donationId;
    }

    public void setDonationId(Integer donationId) {
        this.donationId = donationId;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getFoodType() {
        return foodType;
    }

    public void setFoodType(String foodType) {
        this.foodType = foodType;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public LocalDate getPreparedDate() {
        return preparedDate;
    }

    public void setPreparedDate(LocalDate preparedDate) {
        this.preparedDate = preparedDate;
    }

    public LocalTime getPreparedTime() {
        return preparedTime;
    }

    public void setPreparedTime(LocalTime preparedTime) {
        this.preparedTime = preparedTime;
    }

    public LocalTime getExpiryTime() {
        return expiryTime;
    }

    public void setExpiryTime(LocalTime expiryTime) {
        this.expiryTime = expiryTime;
    }

    public String getPickupAddress() {
        return pickupAddress;
    }

    public void setPickupAddress(String pickupAddress) {
        this.pickupAddress = pickupAddress;
    }

    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User getNgo() {
        return ngo;
    }

    public void setNgo(User ngo) {
        this.ngo = ngo;
    }

    public User getDonor() {
        return donor;
    }

    public void setDonor(User donor) {
        this.donor = donor;
    }
}