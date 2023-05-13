package com.codingdojo.wedding_planner.repositories;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.codingdojo.wedding_planner.models.Music;

public interface MusicRepository extends JpaRepository<Music, Long>{
	@Override
	List<Music> findAll();
	Music findById(long id);
	List<Music> findByType(String type);
	List<Music> findByName(String name);
	List<Music> findByPricePerHour(BigDecimal pricePerHour);
	@Query("SELECT DISTINCT m.type FROM Music m")
    List<String> findAllTypes();
}
