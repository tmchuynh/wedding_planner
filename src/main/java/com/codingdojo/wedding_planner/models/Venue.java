package com.codingdojo.wedding_planner.models;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.persistence.CascadeType;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "venues")
public class Venue {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String name;

	private String city;

	private String state;

	private int capacity;

	private String image;

	private Double rating;

	private Double price;

	@ElementCollection
	@CollectionTable(name = "venue_amenities", joinColumns = @JoinColumn(name = "venue_id"))
	@Column(name = "amenity")
	private List<String> amenities;

	@ElementCollection
	@CollectionTable(name = "venue_restrictions", joinColumns = @JoinColumn(name = "venue_id"))
	@Column(name = "restriction")
	private List<String> restrictions;

	@ElementCollection
	@CollectionTable(name = "venue_peak_season", joinColumns = @JoinColumn(name = "venue_id"))
	@Column(name = "month")
	private List<String> peakSeason;

	@ElementCollection
	@CollectionTable(name = "venue_off_peak_season", joinColumns = @JoinColumn(name = "venue_id"))
	@Column(name = "month")
	private List<String> offPeakSeason;

	// One-to-Many relationship with MonthlyPrice
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "venue")
	private List<MonthlyPrice> monthlyPrices;

	// One-to-Many relationship with Decoration
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "venue")
	private List<Decoration> availableDecor;

	// One-to-Many relationship with GuestRoom
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "venue")
	private List<GuestRoom> guestRooms;

	// One-to-Many relationship with Catering
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "venue")
	private List<Catering> catering;

	public Venue() {

	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public List<String> getPeakSeason() {
		return peakSeason;
	}

	public void setPeakSeason(List<String> peakSeason) {
		this.peakSeason = peakSeason;
	}

	public List<String> getOffPeakSeason() {
		return offPeakSeason;
	}

	public void setOffPeakSeason(List<String> offPeakSeason) {
		this.offPeakSeason = offPeakSeason;
	}

	public Double getRating() {
		return rating;
	}

	public void setRating(Double rating) {
		this.rating = rating;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public List<Decoration> getAvailableDecor() {
		return availableDecor;
	}

	public void setAvailableDecor(List<Decoration> availableDecor) {
		this.availableDecor = availableDecor;
	}

	public List<String> getAmenities() {
		return amenities;
	}

	public void setAmenities(List<String> amenities) {
		this.amenities = amenities;
	}

	public List<String> getRestrictions() {
		return restrictions;
	}

	public void setRestrictions(List<String> restrictions) {
		this.restrictions = restrictions;
	}

	public List<MonthlyPrice> getMonthlyPrices() {
		return monthlyPrices;
	}

	public void setMonthlyPrices(List<MonthlyPrice> monthlyPrices) {
		this.monthlyPrices = monthlyPrices;
	}

	public List<GuestRoom> getGuestRooms() {
		return guestRooms;
	}

	public void setGuestRooms(List<GuestRoom> guestRooms) {
		this.guestRooms = guestRooms;
	}

	public List<Catering> getCatering() {
		return catering;
	}

	public void setCatering(List<Catering> catering) {
		this.catering = catering;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public MonthlyPrice getMonthlyPriceForDate(
			@RequestParam("date") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date) {
		String selectedMonth = date.getMonth().name();

		for (MonthlyPrice monthlyPrice : monthlyPrices) {
			if (monthlyPrice.getMonth().equalsIgnoreCase(selectedMonth)) {
				return monthlyPrice;
			}
		}

		return null;
	}

}
