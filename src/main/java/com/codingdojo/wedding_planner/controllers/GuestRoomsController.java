package com.codingdojo.wedding_planner.controllers;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.wedding_planner.models.GuestRoom;
import com.codingdojo.wedding_planner.models.Venue;
import com.codingdojo.wedding_planner.repositories.VenueRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/rooms")
public class GuestRoomsController {
	@Autowired
	private VenueRepository venueRepository;

	/**
	 * Retrieves room options based on the venue ID given,
	 * sets the model attributes for room options, venue, and selected date,
	 * and sets the session attributes for selected date and room options.
	 *
	 * @param venueId the ID of the venue to retrieve room options from
	 * @param model   the model to add the attributes to
	 * @param session the session to set the attributes in
	 * @return the name of the view to be rendered
	 */
	@GetMapping("/{id}")
	public String getAll(@PathVariable("id") Long venueId, Model model, HttpSession session) {
		Venue venue = venueRepository.findById(venueId).orElse(null);
		if (venue != null) {
			List<GuestRoom> roomOptions = venue.getGuestRooms();
			Object selectedDate = session.getAttribute("date");
			LocalDate selectedDateValue = null;
			if (selectedDate instanceof LocalDate) {
				selectedDateValue = (LocalDate) selectedDate;
			}
			model.addAttribute("roomOptions", roomOptions);
			model.addAttribute("venue", venue);
			model.addAttribute("selectedDate", selectedDateValue);

			session.setAttribute("selectedDate", selectedDateValue);
			session.setAttribute("roomOptions", roomOptions);
		}
		return "roomOptions";
	}

}
