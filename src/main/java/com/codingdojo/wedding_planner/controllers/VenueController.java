package com.codingdojo.wedding_planner.controllers;

import java.text.DecimalFormat;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.wedding_planner.models.Food;
import com.codingdojo.wedding_planner.models.Venue;
import com.codingdojo.wedding_planner.repositories.FoodRepository;
import com.codingdojo.wedding_planner.repositories.VenueRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/venues")
public class VenueController {
	@Autowired
	private FoodRepository foodRepository;

	@Autowired
	private VenueRepository venueRepository;

	@GetMapping("")
	public String getAll(Model model, HttpSession session,
			@RequestParam(name = "restriction", required = false) String restriction) {
		List<Food> foodList = foodRepository.findAll();
		List<Venue> venueList = venueRepository.findAll();

		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
		for (Venue venue : venueList) {
			String formattedFromDate = venue.getAvailableFromDate().format(dateFormatter);
			String formattedToDate = venue.getAvailableToDate().format(dateFormatter);
			venue.setFormattedFromDate(formattedFromDate);
			venue.setFormattedToDate(formattedToDate);
		}

		DecimalFormat decimalFormat = new DecimalFormat("#0.00");
		for (Food food : foodList) {
			double formattedPrice = Double.parseDouble(decimalFormat.format(food.getPrice()));
			food.setFormattedPrice(formattedPrice);
		}

		List<String> foodRestrictions = foodRepository.findAllRestrictions();

		// Apply food restriction filter
		if (restriction != null && !restriction.isEmpty()) {
			List<Food> filteredFoods = foodRepository.findByRestrictions(restriction);
			for (Venue venue1 : venueList) {
				List<Food> availableFoods = venue1.getAvailableFoods();
				availableFoods.retainAll(filteredFoods);
			}
		}

		model.addAttribute("foodList", foodList);
		model.addAttribute("venueList", venueList);
		model.addAttribute("foodRestrictions", foodRestrictions);
		return "venue";
	}
}
