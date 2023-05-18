package com.codingdojo.wedding_planner.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.stereotype.Service;

import com.codingdojo.wedding_planner.models.GuestRoom;
import com.codingdojo.wedding_planner.repositories.GuestRoomRepository;

@Service
public class GuestRoomService {
    @Autowired
    private GuestRoomRepository guestRoomRepo;

    public List<GuestRoom> getAllRooms() {
        return guestRoomRepo.findAll();
    }

    public GuestRoom getRoomById(Long id) throws NotFoundException {
        return guestRoomRepo.findById(id)
                .orElseThrow(() -> new NotFoundException());
    }
}
