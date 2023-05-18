package com.codingdojo.wedding_planner.models;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "caterings")
public class Catering {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String name;

	private Double staff_price;

	@ElementCollection
	@CollectionTable(name = "catering_staff", joinColumns = @JoinColumn(name = "catering_id"))
	@Column(name = "staff")
	private List<String> staff;

	private String image;

	// One-to-Many relationship with Food
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "catering")
	private List<Food> availableFoods;

	// Many-to-One relationship with Venue
	@ManyToOne
	@JoinColumn(name = "venue_id")
	private Venue venue;

	public Catering() {

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

	public Double getStaff_price() {
		return staff_price;
	}

	public void setStaff_price(Double staff_price) {
		this.staff_price = staff_price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public List<Food> getAvailableFoods() {
		return availableFoods;
	}

	public void setAvailableFoods(List<Food> availableFoods) {
		this.availableFoods = availableFoods;
	}
}
