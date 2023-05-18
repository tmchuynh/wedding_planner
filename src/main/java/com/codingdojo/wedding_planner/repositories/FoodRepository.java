package com.codingdojo.wedding_planner.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.codingdojo.wedding_planner.models.Food;

public interface FoodRepository extends JpaRepository<Food, Long> {
    @Override
    List<Food> findAll();

    Food findById(long id);

    List<Food> findByName(String name);

    List<Food> findByRestrictionsIn(List<String> restrictions);

    List<Food> findByRestrictions(String restriction);

    /**
     * Retrieves a list of distinct food restrictions from the database.
     *
     * @return a List of Strings containing all the distinct food restrictions in
     *         the database
     */
    @Query("SELECT DISTINCT f.restrictions FROM Food f")
    List<String> findAllRestrictions();

}
