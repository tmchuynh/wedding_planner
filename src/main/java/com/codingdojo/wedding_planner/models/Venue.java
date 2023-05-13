package com.codingdojo.wedding_planner.models;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "venues")
public class Venue {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String name;

	private String address;

	private String city;

	private String zip_code;
	
	private int capacity;

	private BigDecimal pricePerHour;

	private String image;

	private LocalDateTime availableFromDate;

	private LocalDateTime availableToDate;

	private String formattedFromDate;
    private String formattedToDate;

	// one to many relationship with food
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "venue")
	private List<Food> availableFoods;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "venue")
	private List<Decoration> availableDecor;

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public BigDecimal getPricePerHour() {
		return pricePerHour;
	}

	public void setPricePerHour(BigDecimal pricePerHour) {
		this.pricePerHour = pricePerHour;
	}

	public LocalDateTime getAvailableFromDate() {
		return availableFromDate;
	}

	public void setAvailableFromDate(LocalDateTime availableFromDate) {
		this.availableFromDate = availableFromDate;
	}

	public LocalDateTime getAvailableToDate() {
		return availableToDate;
	}

	public void setAvailableToDate(LocalDateTime availableToDate) {
		this.availableToDate = availableToDate;
	}

	public String getFormattedFromDate() {
		return formattedFromDate;
	}

	public void setFormattedFromDate(String formattedFromDate) {
		this.formattedFromDate = formattedFromDate;
	}

	public String getFormattedToDate() {
		return formattedToDate;
	}

	public void setFormattedToDate(String formattedToDate) {
		this.formattedToDate = formattedToDate;
	}

	public List<Food> getAvailableFoods() {
		return availableFoods;
	}

	public void setAvailableFoods(List<Food> availableFoods) {
		this.availableFoods = availableFoods;
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
}
