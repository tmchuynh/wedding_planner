package com.codingdojo.wedding_planner.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.stereotype.Service;

import com.codingdojo.wedding_planner.models.Venue;
import com.codingdojo.wedding_planner.repositories.VenueRepository;

@Service
public class VenueService {

    @Autowired
    private VenueRepository venueRepository;

    public List<Venue> getAllVenues() {
        return venueRepository.findAll();
    }

    public Venue getVenueById(Long id) throws NotFoundException {
        return venueRepository.findById(id)
                .orElseThrow(() -> new NotFoundException());
    }

    public Venue createVenue(Venue venue) {
        return venueRepository.save(venue);
    }

    public Venue updateVenue(Long id, Venue venueDetails) throws NotFoundException {
        Venue venue = getVenueById(id);
        venue.setName(venueDetails.getName());
        venue.setAddress(venueDetails.getAddress());
        venue.setCity(venueDetails.getCity());
        venue.setZip_code(venueDetails.getZip_code());
        venue.setPricePerHour(venueDetails.getPricePerHour());
        venue.setAvailableFromDate(venueDetails.getAvailableFromDate());
        venue.setAvailableToDate(venueDetails.getAvailableToDate());
        venue.setAvailableFoods(venueDetails.getAvailableFoods());
        return venueRepository.save(venue);
    }

    public void deleteVenue(Long id) throws NotFoundException {
        Venue venue = getVenueById(id);
        venueRepository.delete(venue);
    }
}

