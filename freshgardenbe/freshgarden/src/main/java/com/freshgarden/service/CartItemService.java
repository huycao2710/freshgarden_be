package com.freshgarden.service;

import com.freshgarden.exception.CartItemException;
import com.freshgarden.exception.UserException;
import com.freshgarden.model.Cart;
import com.freshgarden.model.CartItem;
import com.freshgarden.model.Product;

public interface CartItemService {

	public CartItem createCartItem(CartItem cartItem);
	
	public CartItem updateCartItem(Long userId, Long id, CartItem cartItem) throws CartItemException, UserException;
	
	public CartItem isCartItemExist(Cart cart, Product product, String size, Long userId);
	
	public void removeCartItem(Long userId, Long cartItemId) throws CartItemException, UserException;
	
	public CartItem findCartItemById(Long cartItemId) throws CartItemException;
}
