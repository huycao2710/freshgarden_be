package com.freshgarden.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.freshgarden.exception.ProductException;
import com.freshgarden.model.Product;
import com.freshgarden.model.Rating;
import com.freshgarden.model.User;
import com.freshgarden.repository.RatingRepository;
import com.freshgarden.request.RatingRequest;

@Service
public class RatingServiceImplementation implements RatingService{
	
	private RatingRepository ratingRepository;
	private ProductService productService;
	
	public RatingServiceImplementation(RatingRepository ratingRepository, ProductService productService) {
		this.ratingRepository = ratingRepository;
		this.productService = productService;
	}

	@Override
	public Rating createRating(RatingRequest req, User user) throws ProductException {
		Product product = productService.findProductById(req.getProductId());

		Rating rating = new Rating();
		rating.setProduct(product);
		rating.setUser(user);
		rating.setRating(req.getRating());
		rating.setCreatedAt(LocalDateTime.now());
		return ratingRepository.save(rating);
	}

	@Override
	public List<Rating> getProductRating(Long productId) {
		return ratingRepository.getAllProductsRating(productId);
	}

}
