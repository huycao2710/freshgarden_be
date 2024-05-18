package com.freshgarden.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.freshgarden.exception.ProductException;
import com.freshgarden.model.Product;
import com.freshgarden.request.CreateProductRequest;

public interface ProductService {
	
	public Product createProduct(CreateProductRequest req);
	
	public String deleteProduct(Long productId) throws ProductException;
	
	public Product updateProduct(Long productId, Product req) throws ProductException;
	
	public Product findProductById(Long id) throws ProductException;
	
	public List<Product> findProductByCategory(String category);
	
	public Page<Product> getAllProduct(String category, List<String>sizes, Double minPrice, Double maxPrice,
			Double minDiscount, String sort, String stock, Integer pageNumber, Integer pageSize);
	
	public List<Product> findAllProducts();
}
