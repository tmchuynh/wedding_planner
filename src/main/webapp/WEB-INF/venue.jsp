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
					<th class="text-center">Zip Code</th>
					<th class="text-center">Price/Hour</th>
					<th class="text-center">Available From</th>
					<th class="text-center">Available To</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${venueList}" var="venue">

					<tr class="accordion">
						<td class="col-2"><span class="arrow">&#x25B6;</span>${venue.name}</td>
						<td class="col-2">${venue.address}</td>
						<td class="col-1">${venue.city}</td>
						<td class="col-1 text-center">${venue.zip_code}</td>
						<td class="col-1 text-center">$${venue.pricePerHour}</td>
						<td class="col-1 text-center">${venue.formattedFromDate}</td>
						<td class="col-1 text-center">${venue.formattedToDate}</td>
						<td class="col-1 text-center"><a class="btn btn-primary"
								href="/venues/${venue.id}">View Details</a></td>
					</tr>

					<tr class="accordion-content">
						<td colspan="7"><img src="/images/${venue.image }"
							alt="${venue.name }"
							style="width: 200px; height: 200px; object-fit: cover;"
							class="img-thumbnail">
							<h3 class="accordion-header">Featured Foods:</h3>
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
									<c:forEach items="${venue.availableFoods}" var="food"
										varStatus="loop">
										<c:if test="${loop.index < 5}">
											<!-- Set data-restrictions attribute to hold food restrictions -->
											<tr data-restrictions="${food.restrictions}">
												<td class="col-3">${food.name}</td>
												<td class="col-3"><img src="/images/${food.image}"
													class="img-thumbnail" alt="${food.name}"
													style="width: 200px; height: 150px; object-fit: cover;"></td>
												<td class="col-6">${food.description}</td>
												<td class="col-1">$${food.formattedPrice}</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>

							</table></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/js/venue.js"></script>


</body>
</html>