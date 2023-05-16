package com.codingdojo.wedding_planner.models;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "guest_rooms")
public class GuestRoom {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String type;

    private int capacity;

    // One-to-Many relationship with RoomAvailability
    @OneToMany(mappedBy = "room", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<RoomAvailability> availabilities = new HashSet<>();

    // Many-to-One relationship with Venue
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "venue_id")
    private Venue venue;

    public GuestRoom() {
    	
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Set<RoomAvailability> getAvailabilities() {
		return availabilities;
	}

	public void setAvailabilities(Set<RoomAvailability> availabilities) {
		this.availabilities = availabilities;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}

	public boolean isAvailableOnDate(LocalDate selectedDateValue) {
	    for (RoomAvailability availability : availabilities) {
	        if (availability.getDate().equals(selectedDateValue) && availability.getRoomsAvailable() > 0) {
	            return true;
	        }
	    }
	    return false;
	}

}