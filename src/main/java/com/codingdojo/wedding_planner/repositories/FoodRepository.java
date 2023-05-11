package com.codingdojo.wedding_planner.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.wedding_planner.models.Food;

@Repository
public interface FoodRepository extends JpaRepository<Food, Long>  {
	List<Food> findAll();
	Food findById(long id);
    List<Food> findByName(String name);
    List<Food> findByRestrictionsIn(List<String> restrictions);
}
