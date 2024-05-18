package com.freshgarden.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.freshgarden.exception.OrderException;
import com.freshgarden.model.Order;
import com.freshgarden.response.ApiResponse;
import com.freshgarden.service.OrderService;

@RestController
@RequestMapping("/api/admin/orders")
public class AdminOrderController {
	
	@Autowired
	private OrderService orderService;
	
	@PutMapping("/")
	public ResponseEntity<List<Order>> getAllOrdersHandler(){
		List<Order> orders = orderService.getAllOrders();
		return new ResponseEntity<List<Order>>(orders, HttpStatus.ACCEPTED);
	}
	
	@PutMapping("/{orderId}/confirmed")
	public ResponseEntity<Order> ConfirmedOrderHandler(@PathVariable Long orderId,
			@RequestHeader("Authorization") String jwt) throws OrderException {
		
		Order order = orderService.confirmedOrder(orderId);
		
		return new ResponseEntity<>(order, HttpStatus.OK);
	}
	
	@PutMapping("/{orderId}/ship")
	public ResponseEntity<Order> ShippedOrderHandler(@PathVariable Long orderId,
			@RequestHeader("Authorization") String jwt) throws OrderException{
		Order order = orderService.shippedOrder(orderId);
		
		return new ResponseEntity<>(order, HttpStatus.OK);
	}
	
	@PutMapping("/{orderId}/deliver")
	public ResponseEntity<Order> DeliverOrderHandler(@PathVariable Long orderId,
			@RequestHeader("Authorization") String jwt) throws OrderException{
		Order order = orderService.deliveredOrder(orderId);
		
		return new ResponseEntity<>(order, HttpStatus.OK);
	}
	
	@PutMapping("/{orderId}/cancel")
	public ResponseEntity<Order> CancelOrderHandler(@PathVariable Long orderId,
			@RequestHeader("Authorization") String jwt) throws OrderException{
		Order order = orderService.canceledOrder(orderId);
		
		return new ResponseEntity<>(order, HttpStatus.OK);
	}
	
	public ResponseEntity<ApiResponse> DeleteOrderHandler(@PathVariable Long orderId,
			@RequestHeader("Authorization") String jwt) throws OrderException{
		
		orderService.deleteOrder(orderId);
		
		ApiResponse res = new ApiResponse();
		res.setMessage("Order deleted successfully");
		res.setStatus(true);
		
		return new ResponseEntity<>(res, HttpStatus.OK);
	}
}
