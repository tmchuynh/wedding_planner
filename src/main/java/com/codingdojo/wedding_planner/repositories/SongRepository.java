package com.codingdojo.wedding_planner.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.codingdojo.wedding_planner.models.Song;

public interface SongRepository extends JpaRepository <Song, Long>{
	List<Song> findByTitle(String title);
	Song findById(long id);
	@Override
	List<Song> findAll();
}
