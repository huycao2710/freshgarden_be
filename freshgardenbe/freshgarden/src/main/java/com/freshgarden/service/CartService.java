package com.freshgarden.service;

import com.freshgarden.exception.ProductException;
import com.freshgarden.model.Cart;
import com.freshgarden.model.User;
import com.freshgarden.request.AddItemRequest;

public interface CartService {

	public Cart createCart(User user);
	
	public String addCartItem(Long userId, AddItemRequest req) throws ProductException;
	
	public Cart findUserCart(Long userId);
}
