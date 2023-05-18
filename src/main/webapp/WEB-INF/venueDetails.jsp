<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Venue Details</title>
				<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
				<link rel="stylesheet" type="text/css" href="/css/main.css">
				<link rel="stylesheet" type="text/css" href="/css/grid.css">
				<link rel="stylesheet" type="text/css" href="/css/venue.css">
			</head>

			<body>
				<div class="container-fluid body-container p-4">
					<img src="/images/extra/image3.png" alt="venue" class="image1">
					<div class="d-flex justify-content-between">
						<h1 class="main">${venue != null ? venue.name : ''} Details</h1>
						<div class="d-flex justify-content-between">
							<a class="btn btn-secondary m-3" href="/venues">Back to Venue List</a>
							<a class="btn btn-primary m-3" href="/catering/${venue.id }">Continue</a>
						</div>
					</div>
					<form action="/venues/${venue.id }" method="get">
						<input type="date" name="date" required value="${date }"> <input type="hidden" name="venueId"
							value="${venue.id}" class="form-input"> <input type="submit" value="Check Price"
							class="btn btn-primary">
					</form>
					<hr>
					<h3 class="main">${venue.name}</h3>
					<p>City: ${venue.city}</p>
					<p>State: ${venue.state}</p>
					<p>Price: $${venue.price }</p>

					<h3 class="main">Selected Date: ${date}</h3>
					<c:if test="${price != null}">
						<p>Reception Price: $${price.receptionStartingPrice}</p>
						<p>Ceremony Price: $${price.ceremonyStartingPrice}</p>
						<p>Bar Price: $${price.barStartingPrice}</p>
						<c:if test="${price.peakSeason}">
							<p>
								Off Peak Season (
								<c:forEach items="${venue.offPeakSeason}" var="offPeakSeason">
									<span>${fn:substring(offPeakSeason, 0, 3)}</span>
								</c:forEach>
								)
							</p>
						</c:if>
						<c:if test="${not price.peakSeason}">
							<p>
								Peak Season (
								<c:forEach items="${venue.peakSeason}" var="peakSeason">
									<span>${fn:substring(peakSeason, 0, 3)}</span>
								</c:forEach>
								)
							</p>
						</c:if>

					</c:if>

					<table class="table">
						<thead>
							<tr class="main">
								<th class="col-4">Amenities</th>
								<th class="col-4">Restrictions</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-4">
									<c:forEach items="${venue.amenities}" var="amenity">
										<p>
											<i class="bi bi-check-lg"></i>${amenity}
										</p>
										<br>
									</c:forEach>
								</td>
								<td class="col-4">
									<c:forEach items="${venue.restrictions}" var="restriction">
										<p>
											<i class="bi bi-x"></i>${restriction}
										</p>
										<br>
									</c:forEach>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			</body>

			</html>