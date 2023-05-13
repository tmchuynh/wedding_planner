package com.codingdojo.wedding_planner.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.codingdojo.wedding_planner.models.Food;
import com.codingdojo.wedding_planner.models.Venue;
import com.codingdojo.wedding_planner.services.FoodService;
import com.codingdojo.wedding_planner.services.VenueService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
    private FoodService foodService;
    
    @Autowired
    private VenueService venueService;

    @GetMapping("/")
    public String displaySelectedFoods(Model model, HttpSession session) throws NotFoundException {
        List<Map<String, Object>> selectedFoods = (List<Map<String, Object>>) session.getAttribute("selectedFoods");
        if (selectedFoods == null) {
            selectedFoods = new ArrayList<>();
        }
        
        List<Map<String, Object>> foodVenueList = new ArrayList<>();
        for (Map<String, Object> entry : selectedFoods) {
            Long foodId = (Long) entry.get("foodId");
            Long venueId = (Long) entry.get("venueId");
            
            // Fetch the Food and Venue details using the FoodService and VenueService
            Food food = foodService.getFoodById(foodId);
            Optional<Venue> venue = venueService.getVenueById(venueId);
            
            // Create a map to hold the Food and Venue details together
            Map<String, Object> foodVenueMap = new HashMap<>();
            foodVenueMap.put("food", food);
            foodVenueMap.put("venue", venue);
            foodVenueList.add(foodVenueMap);
        }
        
        model.addAttribute("foodVenueList", foodVenueList);
        return "selectedFoods";
    }

}
