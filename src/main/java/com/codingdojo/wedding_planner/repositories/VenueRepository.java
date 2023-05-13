package com.codingdojo.wedding_planner.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.codingdojo.wedding_planner.models.Venue;

public interface VenueRepository extends JpaRepository<Venue, Long> {
	@Override
	List<Venue> findAll();
    Optional<Venue> findById(Long id);
    List<Venue> findByName(String name);
    List<Venue> findByCity(String city);
}
