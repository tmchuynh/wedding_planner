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

	/**
	 * Returns the catering options for a given venue.
	 * 
	 *
	 * @param venueId The ID of the venue to get catering options for
	 * @param model   The model to add the catering options and venue to
	 * @return A string representing the name of the view to display catering
	 *         options
	 */
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
