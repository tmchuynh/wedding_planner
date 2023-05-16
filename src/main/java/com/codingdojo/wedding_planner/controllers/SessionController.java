package com.codingdojo.wedding_planner.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.wedding_planner.models.Catering;
import com.codingdojo.wedding_planner.models.GuestRoom;
import com.codingdojo.wedding_planner.repositories.CateringRepository;
import com.codingdojo.wedding_planner.repositories.GuestRoomRepository;
import com.codingdojo.wedding_planner.repositories.VenueRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/quote")
public class SessionController {
	@Autowired
	private GuestRoomRepository roomRepository;
	
	@Autowired
	private CateringRepository cateringRepository;
	
	
	@GetMapping("")
	public String getQuote(Model model, HttpSession session) {
		System.out.println(session.getAttribute("venue")); // venue model
		model.addAttribute("venue", session.getAttribute("venue"));
		
		System.out.println(session.getAttribute("date")); // yyy-mm-dd date
		model.addAttribute("selectedDate", session.getAttribute("date"));
		
		System.out.println(session.getAttribute("price")); // monthly price model
		model.addAttribute("monthlyPrice", session.getAttribute("price"));
		
		System.out.println(session.getAttribute("roomDetails")); // room id
		Optional<GuestRoom> room = roomRepository.findById((Long) session.getAttribute("roomDetails"));
		model.addAttribute("room", room);
		
		System.out.println(session.getAttribute("counterNumber")); // null
		model.addAttribute(session.getAttribute("counterNumber"));
		
		
		System.out.println(session.getAttribute("catering")); // catering id
		Optional<Catering> cater = cateringRepository.findById((Long) session.getAttribute("catering"));
		model.addAttribute("cater", cater);
		
		return "quote";
	}

}
