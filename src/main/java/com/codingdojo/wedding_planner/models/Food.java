package com.codingdojo.wedding_planner.models;

import java.util.Set;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "foods")
public class Food {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String name;

	private String description;

	private double price;

	@Column(name = "formatted_price", columnDefinition = "DECIMAL(10,2) DEFAULT 0.00")
	private double formattedPrice;

	private String image;

	@ElementCollection
	@CollectionTable(name = "food_restrictions", joinColumns = @JoinColumn(name = "food_id"))
	@Column(name = "restriction")
	private Set<String> restrictions;

	// many to one relationship with venue
	@ManyToOne
	@JoinColumn(name = "venue_id")
	private Venue venue;

	@Column(name = "on_change_action", columnDefinition = "TEXT") // Specify the SQL type as TEXT
    private String onChangeAction;

	public Food() {

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getFormattedPrice() {
		return formattedPrice;
	}

	public void setFormattedPrice(double formattedPrice) {
		this.formattedPrice = formattedPrice;
	}

	public Set<String> getRestrictions() {
		return restrictions;
	}

	public void setRestrictions(Set<String> restrictions) {
		this.restrictions = restrictions;
	}

	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	public String getOnChangeAction() {
        return onChangeAction;
    }

	public void setOnChangeAction(String action) {
		this.onChangeAction = action;
		
	}
}
