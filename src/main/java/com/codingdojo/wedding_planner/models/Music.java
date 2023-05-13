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
@Table(name="musics")
public class Music {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String name;

	private String type;

	private LocalDateTime availableFromDate;
	private LocalDateTime availableToDate;

	private String formattedFromDate;
	private String formattedToDate;

	private BigDecimal pricePerHour;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "music")
	private List<Song> availableSongs;

	public Music() {

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public BigDecimal getPricePerHour() {
		return pricePerHour;
	}

	public void setPricePerHour(BigDecimal pricePerHour) {
		this.pricePerHour = pricePerHour;
	}

	public List<Song> getAvailableSongs() {
		return availableSongs;
	}

	public void setAvailableSongs(List<Song> availableSongs) {
		this.availableSongs = availableSongs;
	}
}
