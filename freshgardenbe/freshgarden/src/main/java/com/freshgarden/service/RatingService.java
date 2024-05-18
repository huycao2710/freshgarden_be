package com.freshgarden.service;

import java.util.List;

import com.freshgarden.exception.ProductException;
import com.freshgarden.model.Rating;
import com.freshgarden.model.User;
import com.freshgarden.request.RatingRequest;

public interface RatingService {

	public Rating createRating(RatingRequest req, User user) throws ProductException;
	public List<Rating> getProductRating(Long productId);
	
}
