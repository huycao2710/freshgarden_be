package com.freshgarden.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Embedded;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String nameProduct;
	
	private String description;
	
	private double price;
	
	@Column(name = "discounted_price")
	private double discountedPrice;
	
	@Column(name = "discount_persent")
	private double discountPersent;
	
	@Column(name = "count_in_stock")
	private double countInStock;
	
	@Embedded
	@ElementCollection
	@Column(name = "sizes")
	private Set<Size> sizes = new HashSet<>();
	
	
	@Column(name = "image_url")
	private String imageUrl;
	
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Rating> ratings = new ArrayList<>();
	
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Review> reviews = new ArrayList<>();
	
	@Column(name = "num_ratings")
	private int numRatings;
	
	@ManyToOne()
	@JoinColumn(name="category_id")
	private Category category;
	
	private LocalDateTime createdAt;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(Long id, String nameProduct, String description, double price, double discountedPrice,
			double discountPersent, double countInStock, Set<Size> sizes, String imageUrl, List<Rating> ratings,
			List<Review> reviews, int numRatings, Category category, LocalDateTime createdAt) {
		super();
		this.id = id;
		this.nameProduct = nameProduct;
		this.description = description;
		this.price = price;
		this.discountedPrice = discountedPrice;
		this.discountPersent = discountPersent;
		this.countInStock = countInStock;
		this.sizes = sizes;
		this.imageUrl = imageUrl;
		this.ratings = ratings;
		this.reviews = reviews;
		this.numRatings = numRatings;
		this.category = category;
		this.createdAt = createdAt;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNameProduct() {
		return nameProduct;
	}

	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getDiscountedPrice() {
		return discountedPrice;
	}

	public void setDiscountedPrice(double discountedPrice) {
		this.discountedPrice = discountedPrice;
	}

	public double getDiscountPersent() {
		return discountPersent;
	}

	public void setDiscountPersent(double discountPersent) {
		this.discountPersent = discountPersent;
	}

	public double getCountInStock() {
		return countInStock;
	}

	public void setCountInStock(double countInStock) {
		this.countInStock = countInStock;
	}

	public Set<Size> getSizes() {
		return sizes;
	}

	public void setSizes(Set<Size> sizes) {
		this.sizes = sizes;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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

	public int getNumRatings() {
		return numRatings;
	}

	public void setNumRatings(int numRatings) {
		this.numRatings = numRatings;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
}
