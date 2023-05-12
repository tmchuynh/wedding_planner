package com.codingdojo.wedding_planner.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.stereotype.Service;

import com.codingdojo.wedding_planner.models.Music;
import com.codingdojo.wedding_planner.repositories.MusicRepository;

@Service
public class MusicService {
	@Autowired
	private MusicRepository musicRepository;
	
	public List<Music> getAllMusic() {
		return musicRepository.findAll();
	}
	
	public Music getMusicById(Long id) throws NotFoundException {
		return musicRepository.findById(id).orElseThrow(() -> new NotFoundException());
	}
	
	public Music updateMusic(Long id, Music musicDetails) throws NotFoundException {
		Music music = getMusicById(id);
		music.setName(musicDetails.getName());
		music.setAvailableFromDate(musicDetails.getAvailableFromDate());
		music.setAvailableToDate(musicDetails.getAvailableToDate());
		music.setPricePerHour(musicDetails.getPricePerHour());
		music.setAvailableSongs(musicDetails.getAvailableSongs());
		return musicRepository.save(music);
	}
	
	public void deleteMusic(Long id) throws NotFoundException {
		Music music = getMusicById(id);
		musicRepository.delete(music);
	}
}
