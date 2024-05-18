package com.freshgarden.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.freshgarden.exception.CartItemException;
import com.freshgarden.exception.UserException;
import com.freshgarden.model.CartItem;
import com.freshgarden.model.User;
import com.freshgarden.response.ApiResponse;
import com.freshgarden.service.CartItemService;
import com.freshgarden.service.UserService;

@RestController
@RequestMapping("/api/cart_items")
public class CartItemController {
	 
	@Autowired
	public UserService userService;
	
	@Autowired
	public CartItemService cartItemService;

	@PutMapping("/{cartItemId}")
	public ResponseEntity<CartItem> updateCartItem(@RequestBody CartItem cartItem, @PathVariable Long cartItemId, @RequestHeader("Authorization") String jwt) throws UserException, CartItemException{
		User user = userService.findUserProfileByJwt(jwt);
		
		CartItem updatedCartItem = cartItemService.updateCartItem(user.getId(), cartItemId, cartItem);
		
		return new ResponseEntity<>(updatedCartItem,HttpStatus.OK);
	}
	
	@DeleteMapping("/{cartItemId}")
	public ResponseEntity<ApiResponse> deleteCartItem(@PathVariable Long cartItemId,
			@RequestHeader("Authorization") String jwt) throws UserException, CartItemException{
		User user = userService.findUserProfileByJwt(jwt);
		cartItemService.removeCartItem(user.getId(), cartItemId);
		
		ApiResponse res = new ApiResponse();
		res.setMessage("Deleted product from cart");
		res.setStatus(true);
		return new ResponseEntity<>(res, HttpStatus.OK);
	}
}
