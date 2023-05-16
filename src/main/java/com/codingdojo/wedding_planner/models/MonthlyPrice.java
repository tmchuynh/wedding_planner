package com.codingdojo.wedding_planner.models;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "monthly_prices")
public class MonthlyPrice {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "month")
	private String month;

	@Column(name = "reception_starting_price")
	private BigDecimal receptionStartingPrice;

	@Column(name = "ceremony_starting_price")
	private BigDecimal ceremonyStartingPrice;

	@Column(name = "bar_starting_price")
	private BigDecimal barStartingPrice;

	@Column(name = "is_peak_season")
	private Boolean peakSeason;
	
	// Many-to-One relationship with Venue
	@ManyToOne
	@JoinColumn(name = "venue_id")
	private Venue venue;

	public MonthlyPrice() {

	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public BigDecimal getReceptionStartingPrice() {
		return receptionStartingPrice;
	}

	public void setReceptionStartingPrice(BigDecimal receptionStartingPrice) {
		this.receptionStartingPrice = receptionStartingPrice;
	}

	public BigDecimal getCeremonyStartingPrice() {
		return ceremonyStartingPrice;
	}

	public void setCeremonyStartingPrice(BigDecimal ceremonyStartingPrice) {
		this.ceremonyStartingPrice = ceremonyStartingPrice;
	}

	public BigDecimal getBarStartingPrice() {
		return barStartingPrice;
	}

	public void setBarStartingPrice(BigDecimal barStartingPrice) {
		this.barStartingPrice = barStartingPrice;
	}

	public Boolean getPeakSeason() {
		return peakSeason;
	}

	public void setPeakSeason(Boolean peakSeason) {
		this.peakSeason = peakSeason;
	}

}
