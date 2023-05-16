package com.codingdojo.wedding_planner.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.stereotype.Service;

import com.codingdojo.wedding_planner.models.Decoration;
import com.codingdojo.wedding_planner.repositories.DecorationRepository;

@Service
public class DecorationService {
	@Autowired
	private DecorationRepository decorRepository;
	
	public List<Decoration> getAllDecor() {
		return decorRepository.findAll();
	}
	
	public Decoration getDecorById(Long id) throws NotFoundException {
        return decorRepository.findById(id)
                .orElseThrow(() -> new NotFoundException());
    }
}
