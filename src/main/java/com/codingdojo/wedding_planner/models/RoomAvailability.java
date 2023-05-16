package com.codingdojo.wedding_planner.models;

import java.math.BigDecimal;
import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "room_availabilities")
public class RoomAvailability {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate date;

    private int roomsAvailable;

    private BigDecimal pricePerNight;

    // Many-to-One relationship with GuestRoom
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "room_id")
    private GuestRoom room;
    
    public RoomAvailability() {
    	
    }

    public RoomAvailability(LocalDate date, int roomsAvailable, BigDecimal pricePerNight) {
        this.date = date;
        this.roomsAvailable = roomsAvailable;
        this.pricePerNight = pricePerNight;
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public int getRoomsAvailable() {
		return roomsAvailable;
	}

	public void setRoomsAvailable(int roomsAvailable) {
		this.roomsAvailable = roomsAvailable;
	}

	public BigDecimal getPricePerNight() {
		return pricePerNight;
	}

	public void setPricePerNight(BigDecimal pricePerNight) {
		this.pricePerNight = pricePerNight;
	}

	public GuestRoom getRoom() {
		return room;
	}

	public void setRoom(GuestRoom room) {
		this.room = room;
	}

    public boolean isAvailableOnDate(LocalDate selectedDate) {
        return date.equals(selectedDate);
    }
}
