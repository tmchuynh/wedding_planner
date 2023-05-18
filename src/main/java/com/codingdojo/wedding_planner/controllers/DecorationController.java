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

	/**
	 * Retrieves a list of decoration options for a given venue and catering ID.
	 *
	 * @param venueId    the ID of the venue to retrieve decoration options for
	 * @param cateringId the ID of the catering option chosen
	 * @param model      the model used to add attributes to the view
	 * @param session    the HTTP session
	 * @return the name of the view to display decoration options
	 */
	@GetMapping("/{venueId}/{cateringId}")
	public String getAll(@PathVariable("venueId") Long venueId, @PathVariable("cateringId") Long cateringId,
			Model model, HttpSession session) {
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
