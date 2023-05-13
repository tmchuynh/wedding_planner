<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/grid.css">
</head>
<body>
	<div class="container-fluid p-4">
		<div class="d-flex justify-content-between">
			<h1>${venue.isPresent() ? venue.get().name : ''}</h1>
			<button class="btn btn-primary" onclick="toggleView()">Toggle
				View</button>
		</div>
		<a class="btn btn-secondary" href="/venues">Back</a>
		<div id="table-view">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Name</th>
						<td></td>
						<th>Description</th>
						<th>Price</th>
						<th>Select</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${venue.get().availableFoods}" var="food">
						<tr data-restrictions="${food.restrictions}">
							<td class="col-3">${food.name}</td>
							<td class="col-3"><img src="/images/${food.image}"
								class="img-thumbnail" alt="${food.name}"
								style="width: 200px; height: 150px; object-fit: cover;"></td>
							<td class="col-6">${food.description}</td>
							<td class="col-2">${food.formattedPrice}</td>
							<td class="col-1"><input class="form-check-input"
								id="${food.id}" data-toggle="toggle" type="checkbox"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="grid-view" class="grid-view" style="display: none;">
			<c:forEach items="${venue.get().availableFoods}" var="food">
				<div class="card">
					<img src="/images/${food.image}" class="card-img-top"
						alt="${food.name}">
					<div class="card-body">
						<h5 class="card-title">${food.name}</h5>
						<p class="card-text">${food.description}</p>
						<p class="card-text">$${food.formattedPrice}</p>
						<div class="form-check">
							<input class="form-check-input" id="${food.id}"
								data-toggle="toggle" type="checkbox"
								onchange="selectFood(${food.id}, ${venue.get().id})"> <label
								class="form-check-label" for="flexCheckDefault">Select</label>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	// doesn't work
	// functions don't get called when checkboxes are clicked
	document.addEventListener('DOMContentLoaded', function() {
		console.log("loaded");
		  // Attach event handler to checkboxes
		  var checkboxes = document.querySelectorAll('input[type="checkbox"]');
		  checkboxes.forEach(function(checkbox) {
		    checkbox.addEventListener('change', function() {
		      var foodId = this.id;
		      var venueId = ${venue.get().id};
		      selectFood(foodId, venueId);
		    });
		  });
		});
	
	
	function selectFood(foodId, venueId) {
	    const checkbox = document.getElementById(`${foodId}`);
	    const isChecked = checkbox.checked;
	    const selectedFoods = sessionStorage.getItem('selectedFoods') ? JSON.parse(sessionStorage.getItem('selectedFoods')) : [];

	    if (isChecked) {
	        const food = { id: foodId };
	        const venue = { id: venueId };
	        selectedFoods.push({ food, venue });
	    } else {
	        const index = selectedFoods.findIndex(entry => entry.food.id === foodId && entry.venue.id === venueId);
	        if (index > -1) {
	            selectedFoods.splice(index, 1);
	        }
	    }

	    console.log(`Food ID: ${foodId}, Venue ID: ${venueId}, Checked: ${isChecked}`);
	    sessionStorage.setItem('selectedFoods', JSON.stringify(selectedFoods));
	}
	</script>
	<script src="/js/foodToggle.js"></script>
</body>
</html>