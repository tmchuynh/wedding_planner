package com.codingdojo.wedding_planner.controllers;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.wedding_planner.models.MonthlyPrice;
import com.codingdojo.wedding_planner.models.Venue;
import com.codingdojo.wedding_planner.repositories.VenueRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/venues")
public class VenueController {

	@Autowired
	private VenueRepository venueRepository;

	@GetMapping("")
	public String getAll(Model model,
			@RequestParam(name = "restriction", required = false) String restriction) {
		List<Venue> venueList = venueRepository.findAll();

		model.addAttribute("venueList", venueList);

		return "venue";
	}
	
	@GetMapping("/{id}")
	public String getVenueDetails(
	    Model model,
	    @RequestParam(value = "date", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Optional<LocalDate> date,
	    @PathVariable("id") Long venueId, HttpSession session
	) {
	    LocalDate selectedDate = date.orElse(LocalDate.now());
	    
	    Venue venue = venueRepository.findById(venueId).orElse(null);
	    MonthlyPrice price = venue.getMonthlyPriceForDate(selectedDate);
	    if (venue != null) {
	        model.addAttribute("venue", venue);
	        model.addAttribute("date", selectedDate);
	        model.addAttribute("price", price);
	        session.setAttribute("venue", venue);
	        session.setAttribute("date", selectedDate);
	        session.setAttribute("price", price);
	    }
	    
	    if (session.getAttribute("venue") != null) {
	        session.setAttribute("venue", venue);
	        session.setAttribute("date", selectedDate);
	        session.setAttribute("price", price);
	    }
	    return "venueDetails";
	}




}
