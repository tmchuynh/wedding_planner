package com.codingdojo.wedding_planner.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.wedding_planner.models.Venue;

@Repository
public interface VenueRepository extends JpaRepository<Venue, Long> {
	List<Venue> findAll();
    Venue findById(long id);
    List<Venue> findByName(String name);
    List<Venue> findByCity(String city);
}
