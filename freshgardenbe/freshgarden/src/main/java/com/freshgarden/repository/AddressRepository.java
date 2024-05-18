package com.freshgarden.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.freshgarden.model.Address;

public interface AddressRepository extends JpaRepository<Address, Long>{

}
