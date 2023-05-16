package com.codingdojo.wedding_planner.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.stereotype.Service;

import com.codingdojo.wedding_planner.models.MonthlyPrice;
import com.codingdojo.wedding_planner.repositories.MonthlyPriceRepository;

@Service
public class MonthlyPriceService {
    @Autowired
    private MonthlyPriceRepository monthlyPriceRepo;

    public List<MonthlyPrice> getAllRooms() {
        return monthlyPriceRepo.findAll();
    }

    public MonthlyPrice getRoomById(Long id) throws NotFoundException {
        return monthlyPriceRepo.findById(id)
                .orElseThrow(() -> new NotFoundException());
    }
}
