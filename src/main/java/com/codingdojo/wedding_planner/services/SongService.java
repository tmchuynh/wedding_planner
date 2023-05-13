package com.codingdojo.wedding_planner.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.stereotype.Service;

import com.codingdojo.wedding_planner.models.Song;
import com.codingdojo.wedding_planner.repositories.SongRepository;

@Service
public class SongService {

	@Autowired
	private SongRepository songRepository;

	public List<Song> getAllSongs() {
		return songRepository.findAll();
	}

	public Song getSongById(Long id) throws NotFoundException {
		return songRepository.findById(id).orElseThrow(() -> new NotFoundException());
	}

	public Song createSong(Song song) {
		return songRepository.save(song);
	}

	public Song updateSong(Long id, Song songDetails) throws NotFoundException {
        Song song = getSongById(id);
        song.setTitle(songDetails.getTitle());
        song.setLength(songDetails.getLength());
        return songRepository.save(song);
    }

    public void deleteSong(Long id) throws NotFoundException {
        Song song = getSongById(id);
        songRepository.delete(song);
    }
}
