package com.freshgarden.request;

public class AddItemRequest {

	public Long productId;
	public String size;
	public int countInStock;
	public double price;
	
	public AddItemRequest() {
		// TODO Auto-generated constructor stub
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getCountInStock() {
		return countInStock;
	}

	public void setCountInStock(int countInStock) {
		this.countInStock = countInStock;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
}
