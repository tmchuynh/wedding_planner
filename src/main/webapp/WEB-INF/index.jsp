<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wedding Planner</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/accordian.css">
</head>
<body>
	<div class="container-fluid p-4">
		<h1>Wedding Planner</h1>
		<h2>Venues</h2>
		<div class="filter py-3">
			<!-- Filter by Food Restriction dropdown -->
			<div class="form-group">
				<label for="foodRestriction">Filter by Food Restriction:</label> <select
					class="form-control" id="foodRestriction">
					<option value="">All</option>
					<c:forEach items="${foodRestrictions}" var="restriction">
						<option value="${restriction}">${restriction}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>Name</th>
					<th>Address</th>
					<th>City</th>
					<th>Zip Code</th>
					<th>Price per Hour</th>
					<th>Available From</th>
					<th>Available To</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${venueList}" var="venue">

					<tr class="accordion">
						<td><span class="arrow">&#x25B6;</span> ${venue.name}</td>
						<td>${venue.address}</td>
						<td>${venue.city}</td>
						<td>${venue.zip_code}</td>
						<td>$${venue.pricePerHour}</td>
						<td>${venue.formattedFromDate}</td>
						<td>${venue.formattedToDate}</td>
					</tr>
					<tr class="accordion-content">
						<td colspan="7"><img src="/images/${venue.image }" alt="${venue.name }" style="width: 200px; height: 200px; object-fit: cover;" class="img-thumbnail">
							<h3 class="accordion-header">Available Foods:</h3>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Name</th>
										<td></td>
										<th>Description</th>
										<th>Price</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${venue.availableFoods}" var="food">
										<!-- Set data-restrictions attribute to hold food restrictions -->
										<tr data-restrictions="${food.restrictions}">
											<td class="col-3">${food.name}</td>
											<td class="col-3"><img src="/images/${food.image}"
												class="img-thumbnail" alt="${food.name}" style="width: 200px; height: 150px; object-fit: cover;"></td>
											<td class="col-5">${food.description}</td>
											<td class="col-1">${food.formattedPrice}</td>
										</tr>
									</c:forEach>
								</tbody>

							</table></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			// Handle food restriction filtering
			$('#foodRestriction').change(function() {
				const selectedRestriction = $(this).val();
				if (selectedRestriction) {
					// Close all accordions
					$('.accordion').removeClass('opened');
					$('.accordion .arrow').text('▶');
					$('.accordion-content').slideUp();

					$('tr[data-restrictions]').each(function() {
						const restrictions = $(this).data('restrictions');
						// Show the accordion content row if it matches the selected restriction
						if (restrictions.includes(selectedRestriction)) {
							$(this).show();
						}
					});
				} else {
					// Show all accordion content rows when no restriction is selected
					$('tr.accordion-content').show();
				}
			});

			// Initial state of the filter
			$('#foodRestriction').val('');

			// Handle accordion functionality
			$('.accordion').click(function() {
				// Toggle the arrow icon and toggle the accordion state
				$(this).find('.arrow').text(function(_, text) {
					return text === '▼' ? '▶' : '▼';
				});
				$(this).toggleClass('opened');
				$(this).next('.accordion-content').slideToggle();
			});

		});
	</script>


</body>
</html>