package com.codingdojo.wedding_planner.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.codingdojo.wedding_planner.models.GuestRoom;

public interface GuestRoomRepository extends JpaRepository<GuestRoom, Long> {
	List<GuestRoom> findAll();

	Optional<GuestRoom> findById(Long id);
}
