package com.freshgarden.request;

import java.util.HashSet;
import java.util.Set;

import com.freshgarden.model.Size;

public class CreateProductRequest {

	private String nameProduct;
	
	private String description;
	
	private double price;
	
	private double discountedPrice;
	
	private double discountPersent;
	
	private double countInStock;
	
	private Set<Size> sizes = new HashSet<>();
	
	private String imageUrl;
	
	private String topLevelCategory;
	private String secondLevelCategory;
	private String thirdLevelCategory;
	
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
	public String getTopLevelCategory() {
		return topLevelCategory;
	}
	public void setTopLevelCategory(String topLevelCategory) {
		this.topLevelCategory = topLevelCategory;
	}
	public String getSecondLevelCategory() {
		return secondLevelCategory;
	}
	public void setSecondLevelCategory(String secondLevelCategory) {
		this.secondLevelCategory = secondLevelCategory;
	}
	public String getThirdLevelCategory() {
		return thirdLevelCategory;
	}
	public void setThirdLevelCategory(String thirdLevelCategory) {
		this.thirdLevelCategory = thirdLevelCategory;
	}
		
}
