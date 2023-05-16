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

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/decorations")
public class DecorationController {
	@Autowired
	private VenueRepository venueRepository;
	
	// Displays decorations available for the selected venue
	@GetMapping("/{venueId}/{cateringId}")
	public String getAll(@PathVariable("venueId") Long venueId,@PathVariable("cateringId") Long cateringId ,Model model, HttpSession session) {
		Venue venue = venueRepository.findById(venueId).orElse(null);
		session.setAttribute("catering", cateringId);
		if (venue != null) {
			List<Decoration> decorOptions = venue.getAvailableDecor();
			model.addAttribute("decorOptions", decorOptions);
			model.addAttribute("venue", venue);
		}
		return "decorationOptions";
	}
}
