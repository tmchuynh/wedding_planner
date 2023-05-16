package com.codingdojo.wedding_planner.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.wedding_planner.models.Decoration;
import com.codingdojo.wedding_planner.models.Venue;
import com.codingdojo.wedding_planner.repositories.VenueRepository;

@Controller
@RequestMapping("/decorations")
public class DecorationController {
	@Autowired
	private VenueRepository venueRepository;
	
	// Displays decorations available for the selected venue
	@GetMapping("/{id}")
	public String getAll(@PathVariable("id") Long venueId, Model model) {
		Venue venue = venueRepository.findById(venueId).orElse(null);
		if (venue != null) {
			List<Decoration> decorOptions = venue.getAvailableDecor();
			model.addAttribute("decorOptions", decorOptions);
			model.addAttribute("venue", venue);
		}
		return "decorationOptions";
	}
}
