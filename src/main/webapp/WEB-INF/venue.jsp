<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Wedding Planner</title>
			<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
				crossorigin="anonymous">
			<link rel="stylesheet" type="text/css" href="/css/main.css">
			<link rel="stylesheet" type="text/css" href="/css/accordian.css">
			<link rel="stylesheet" type="text/css" href="/css/venue.css">
		</head>

		<body>
			<div class="container-fluid body-container p-4">
				<h1 class="danger">Wedding Planner</h1>
				<h2 class="main">Venues</h2>

				<table class="table table-hover" >
					<thead>
						<tr class="danger">
							<th>‎&#160;&#160;&#160;&#160;&#160;Name</th>
							<th>City</th>
							<th>State</th>
							<th>Rating</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${venueList}" var="venue">

							<tr class="accordion">
								<td class="col-2"><span class="arrow">&#x25B6;</span>
									${venue.name} ${venue.id }</td>
								<td class="col-1">${venue.city}</td>
								<td class="col-1">${venue.state}</td>
								<td class="col-1">${venue.rating}</td>
								<td class="col-1 text-center"><a class="btn btn-primary float-end"
										href="/venues/${venue.id}">Continue</a></td>
							</tr>

							<tr class="accordion-content">
								<td colspan="7"><img src="/images/venues/${venue.image }" alt="${venue.name }"
										style="width: 200px; height: 200px; object-fit: cover;" class="mb-4 img-thumbnail">
									<h3 class="accordion-header main">&#160;Details:</h3>
									<table class="table table-hover">
										<thead>
											<tr class="danger">
												<th class="col-3">Amenities</th>
												<th class="col-3">Restrictions</th>
												<th class="col-3">Peak Season</th>
												<th class="col-3">Off-Peak Season</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="col-3">
													<c:forEach items="${venue.amenities}" var="amenity">
														<p>
															<i class="bi bi-check-lg"></i>${amenity}
														</p>
														<br>
													</c:forEach>
												</td>
												<td class="col-3">
													<c:forEach items="${venue.restrictions}" var="restriction">
														<p>
															<i class="bi bi-x"></i>${restriction}
														</p>
														<br>
													</c:forEach>
												</td>
												<td class="col-3">
													<c:forEach items="${venue.peakSeason}" var="peakSeason">
														<p>
															<i class="bi bi-x"></i>${peakSeason}
														</p>
														<br>
													</c:forEach>
												</td>
												<td class="col-3">
													<c:forEach items="${venue.offPeakSeason}" var="offPeakSeason">
														<p>
															<i class="bi bi-x"></i>${offPeakSeason}
														</p>
														<br>
													</c:forEach>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<img src="/images/extra/image1.png" alt="venue" class="image1">
			</div>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
				crossorigin="anonymous" type="text/javascript"></script>
			<script src="https://code.jquery.com/jquery-3.6.0.min.js" type="text/javascript"></script>
			<script src="/js/accordion.js" type="text/javascript"></script>


		</body>

		</html>