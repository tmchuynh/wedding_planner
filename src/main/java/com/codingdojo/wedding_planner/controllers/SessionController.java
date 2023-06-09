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

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/quote")
public class SessionController {
	@Autowired
	private VenueRepository venueRepository;

	/**
	 * Retrieves a quote for a venue by its ID and populates the model with relevant
	 * data
	 *
	 * @param venueId the ID of the venue to retrieve a quote for
	 * @param model   the model to populate with data
	 * @param session the HttpSession object to use to retrieve session data
	 * @return a string representing the name of the view to render
	 */
	@GetMapping("/{id}")
	public String getQuote(@PathVariable("id") Long venueId, Model model, HttpSession session) {
		Venue venue = venueRepository.findById(venueId).orElse(null);

		if (venue != null) {
			model.addAttribute("venue", session.getAttribute("venue"));

			model.addAttribute("selectedDate", session.getAttribute("date"));

			model.addAttribute("monthlyPrice", session.getAttribute("price"));

			List<Catering> cateringOptions = venue.getCatering();
			for (Catering cater : cateringOptions) {
				if (cater.getId() == session.getAttribute("catering")) {

					session.setAttribute("catering", cater);
				}
			}

			return "quote";
		}
		return "redirect:/venues";
	}

}
