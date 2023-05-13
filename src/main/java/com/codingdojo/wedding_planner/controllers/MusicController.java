package com.codingdojo.wedding_planner.controllers;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.wedding_planner.models.Music;
import com.codingdojo.wedding_planner.repositories.MusicRepository;

@Controller
@RequestMapping("/music")
public class MusicController {

	@Autowired
	private MusicRepository musicRepository;

	@GetMapping("")
	public String getAll(@RequestParam(value = "musicType", required = false) String musicType, Model model) {
	    List<Music> musicList;
	    if (musicType != null && !musicType.isEmpty()) {
	        musicList = musicRepository.findByType(musicType);
	    } else {
	        musicList = musicRepository.findAll();
	    }

	    List<String> musicTypes = musicRepository.findAllTypes();

	    model.addAttribute("musicList", musicList);
	    model.addAttribute("musicTypes", musicTypes);

	    return "music";
	}




}
