package com.freshgarden.service;

import java.util.List;

import com.freshgarden.exception.ProductException;
import com.freshgarden.model.Review;
import com.freshgarden.model.User;
import com.freshgarden.request.ReviewRequest;

public interface ReviewService {

	public Review createReview(ReviewRequest req, User user) throws ProductException;
	public List<Review> getAllReview(Long productId);
}
