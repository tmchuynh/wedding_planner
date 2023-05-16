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
	
	// Displays available rooms dependent on the selected date from venue details page
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
	    }
	    return "roomOptions";
	}


}
