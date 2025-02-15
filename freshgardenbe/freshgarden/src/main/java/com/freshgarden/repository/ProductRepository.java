package com.freshgarden.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.freshgarden.model.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

	 @Query("SELECT p FROM Product p " +
	           "WHERE (:category = '' OR p.category.name = :category) " +
	           "AND ((:minPrice IS NULL AND :maxPrice IS NULL) OR (p.discountedPrice BETWEEN :minPrice AND :maxPrice)) " +
	           "AND (:minDiscount IS NULL OR p.discountPersent >= :minDiscount) " +
	           "ORDER BY " +
	           "CASE WHEN :sort = 'price_low' THEN p.discountedPrice END ASC, " +
	           "CASE WHEN :sort = 'price_high' THEN p.discountedPrice END DESC")
	    public List<Product> filterProduct(@Param("category") String category,
	                                       @Param("minPrice") Double minPrice, 
	                                       @Param("maxPrice") Double maxPrice,
	                                       @Param("minDiscount") Double minDiscount,
	                                       @Param("sort") String sort);
}
