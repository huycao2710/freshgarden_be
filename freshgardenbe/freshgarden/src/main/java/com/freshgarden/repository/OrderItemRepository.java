package com.freshgarden.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.freshgarden.model.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long>{

}
