package com.codingdojo.wedding_planner.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.codingdojo.wedding_planner.models.Catering;

public interface CateringRepository extends JpaRepository<Catering, Long> {
	List<Catering> findAll();
	Optional<Catering> findById(Long id);
}
