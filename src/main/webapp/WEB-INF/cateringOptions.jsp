<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Catering Options</title>
			<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
			<link rel="stylesheet" type="text/css" href="/css/main.css">
			<link rel="stylesheet" type="text/css" href="/css/venue.css">
		</head>

		<body>
			<div class="container-fluid body-container p-4">
				<img src="/images/extra/image4.png" alt="venue" class="image2">
				<div class="d-flex justify-content-between">
					<h1 class="danger">Catering Options for ${venue != null ? venue.name : ''}</h1>
					<a class="btn btn-secondary m-3 float-end" href="/venues">Back to Venue
						List</a>
				</div>

				<table class="table">
					<thead>
						<tr class="danger">
							<th>&#160;&#160;&#160;&#160;&#160;Catering Name</th>
							<th class="col-3">Staff Price</th>
							<th class="col-3">Available Foods</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cateringOptions}" var="catering">
							<tr class="accordion">
								<td><span class="arrow">&#x25B6;</span> ${catering.name}</td>
								<td class="col-3 main" style="font-weight: bold;">$${catering.staff_price}</td>
								<!-- Displays all the different food restrictions available for the catering company -->
								<td class="col-3">
									<c:set var="uniqueRestrictions" value="" />
									<c:forEach items="${catering.availableFoods}" var="food">
										<c:forEach items="${food.restrictions}" var="restriction">
											<c:if test="${!uniqueRestrictions.contains(restriction)}">
												<c:set var="uniqueRestrictions"
													value="${uniqueRestrictions}${restriction}" />
												${restriction}
											</c:if>
										</c:forEach>

									</c:forEach>
								</td>
								<td><a href="/decorations/${venue.id}/${catering.id}"
										class="btn btn-primary float-end">Continue</a></td>
							</tr>
							<tr class="accordion-content">
								<td colspan="7"><img src="/images/catering/${catering.image }" alt="${catering.name }"
										style="width: 200px; height: 200px; object-fit: cover;" class="img-thumbnail">
									<table class="table">
										<thead>
											<tr class="danger">
												<th class="col-1"></th>
												<th class="col-2">Name</th>
												<th class="col-8">Description</th>
												<th class="col-3">Price</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${catering.availableFoods}" var="food">
												<tr>
													<td class="col-1"><img src="/images/food/${food.image }" alt="${food.name }"
															style="width: 150px; height: 150px; object-fit: cover;"
															class="img-thumbnail"></td>
													<td class="col-2">${food.name}</td>
													<td class="col-8">${food.description}</td>
													<td class="col-3 main" style="font-weight: bold;">$${food.price}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
				crossorigin="anonymous" type="text/javascript"></script>
			<script src="https://code.jquery.com/jquery-3.6.0.min.js" type="text/javascript"></script>
			<script src="/js/accordion.js" type="text/javascript"></script>

		</body>

		</html>