package com.codingdojo.wedding_planner.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.stereotype.Service;

import com.codingdojo.wedding_planner.models.Food;
import com.codingdojo.wedding_planner.repositories.FoodRepository;

@Service
public class FoodService {

    @Autowired
    private FoodRepository foodRepository;

    public List<Food> getAllFoods() {
        return foodRepository.findAll();
    }

    public Food getFoodById(Long id) throws NotFoundException {
        return foodRepository.findById(id)
                .orElseThrow(() -> new NotFoundException());
    }

    public Food createFood(Food food) {
        return foodRepository.save(food);
    }

    public Food updateFood(Long id, Food foodDetails) throws NotFoundException {
        Food food = getFoodById(id);
        food.setName(foodDetails.getName());
        food.setDescription(foodDetails.getDescription());
        food.setPrice(foodDetails.getPrice());
        food.setRestrictions(foodDetails.getRestrictions());
//        food.setVenue(foodDetails.getVenue());
        return foodRepository.save(food);
    }

    public void deleteFood(Long id) throws NotFoundException {
        Food food = getFoodById(id);
        foodRepository.delete(food);
    }
}

