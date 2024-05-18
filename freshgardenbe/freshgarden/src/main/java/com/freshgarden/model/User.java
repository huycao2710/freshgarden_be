package com.freshgarden.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Embedded;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String fullName;
	
	private String password;
	
	private String email;
	
	private String role;
	
	private String phoneNumber;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Address> address = new ArrayList<>();
	
	@Embedded
	@ElementCollection
	@CollectionTable(name="payment_information",joinColumns = @JoinColumn(name="user_id"))
	private List<PaymenInformation> paymentInformation = new ArrayList<>();
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	@JsonIgnore
	private List<Rating> ratings = new ArrayList<>();
	
	@JsonIgnore
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Review> reviews = new ArrayList<>();
	
	private LocalDateTime createdAt;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(Long id, String fullName, String password, String email, String role, String phoneNumber,
			List<Address> address, List<PaymenInformation> paymentInformation, List<Rating> ratings,
			List<Review> reviews, LocalDateTime createdAt) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.password = password;
		this.email = email;
		this.role = role;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.paymentInformation = paymentInformation;
		this.ratings = ratings;
		this.reviews = reviews;
		this.createdAt = createdAt;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public List<Address> getAddress() {
		return address;
	}

	public void setAddress(List<Address> address) {
		this.address = address;
	}

	public List<PaymenInformation> getPaymentInformation() {
		return paymentInformation;
	}

	public void setPaymentInformation(List<PaymenInformation> paymentInformation) {
		this.paymentInformation = paymentInformation;
	}

	public List<Rating> getRatings() {
		return ratings;
	}

	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	
}
