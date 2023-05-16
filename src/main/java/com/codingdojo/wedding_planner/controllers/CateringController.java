package com.codingdojo.wedding_planner.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.wedding_planner.models.Catering;
import com.codingdojo.wedding_planner.models.Venue;
import com.codingdojo.wedding_planner.repositories.VenueRepository;

@Controller
@RequestMapping("/catering")
public class CateringController {
	@Autowired
	private VenueRepository venueRepository;
	
	// Displays the catering companies available for the venue selected
	@GetMapping("/{id}")
	public String getAll(@PathVariable("id") Long venueId, Model model) {
	    Venue venue = venueRepository.findById(venueId).orElse(null);
	    if (venue != null) {
	        List<Catering> cateringOptions = venue.getCatering();
	        model.addAttribute("cateringOptions", cateringOptions);
	        model.addAttribute("venue", venue);
	    }
	    return "cateringOptions";
	}


}
