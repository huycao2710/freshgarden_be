package com.freshgarden.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freshgarden.model.OrderItem;
import com.freshgarden.repository.OrderItemRepository;

@Service
public class OrderItemServiceImplementation implements OrderItemService {

	@Autowired
	private OrderItemRepository orderItemRepository;
	
	public OrderItemServiceImplementation(OrderItemRepository orderItemRepository) {
		this.orderItemRepository = orderItemRepository;
	}
	
	@Override
	public OrderItem createOrderItem(OrderItem orderItem) {

		return orderItemRepository.save(orderItem);
	}

}
