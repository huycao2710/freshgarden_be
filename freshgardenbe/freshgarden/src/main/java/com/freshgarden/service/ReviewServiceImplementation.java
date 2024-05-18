package com.freshgarden.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.freshgarden.exception.ProductException;
import com.freshgarden.model.Product;
import com.freshgarden.model.Review;
import com.freshgarden.model.User;
import com.freshgarden.repository.ProductRepository;
import com.freshgarden.repository.ReviewRepository;
import com.freshgarden.request.ReviewRequest;

@Service
public class ReviewServiceImplementation implements ReviewService {
	
	private ReviewRepository reviewRepository;
	private ProductService productService;
	private ProductRepository productRepository;

	public ReviewServiceImplementation(ReviewRepository reviewRepository, ProductService productService, ProductRepository productRepository) {
		this.reviewRepository = reviewRepository;
		this.productService = productService;
		this.productRepository = productRepository; 
	}
	
	@Override
	public Review createReview(ReviewRequest req, User user) throws ProductException {
		Product product = productService.findProductById(req.getProductId());
		
		Review review = new Review();
		review.setUser(user);
		review.setProduct(product);
		review.setReview(req.getReview());
		review.setCreateAt(LocalDateTime.now());
		
		return reviewRepository.save(review);
	}

	@Override
	public List<Review> getAllReview(Long productId) {
		// TODO Auto-generated method stub
		return reviewRepository.getAllProductsReview(productId);
	}

}
