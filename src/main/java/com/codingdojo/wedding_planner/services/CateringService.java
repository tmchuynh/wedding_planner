package com.codingdojo.wedding_planner.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.stereotype.Service;

import com.codingdojo.wedding_planner.models.Catering;
import com.codingdojo.wedding_planner.repositories.CateringRepository;

@Service
public class CateringService {
	@Autowired
	private CateringRepository cateringRepository;

	public List<Catering> getAllCatering() {
		return cateringRepository.findAll();
	}

	public Catering getCateringById(Long id) throws NotFoundException {
		return cateringRepository.findById(id).orElseThrow(() -> new NotFoundException());
	}
}
