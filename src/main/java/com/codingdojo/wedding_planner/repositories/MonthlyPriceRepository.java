package com.codingdojo.wedding_planner.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.codingdojo.wedding_planner.models.MonthlyPrice;

public interface MonthlyPriceRepository extends JpaRepository<MonthlyPrice, Long> {
	List<MonthlyPrice> findAll();

	Optional<MonthlyPrice> findById(Long id);
}
