package com.codingdojo.wedding_planner.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.codingdojo.wedding_planner.models.Decoration;

public interface DecorationRepository extends JpaRepository<Decoration, Long> {
	List<Decoration> findAll();

	Optional<Decoration> findById(Long id);
}
