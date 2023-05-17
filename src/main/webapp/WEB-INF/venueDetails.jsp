<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Venue Details</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/grid.css">
</head>
<body>
	<div class="container-fluid p-4">
		<div class="d-flex justify-content-between">
			<h1>${venue != null ? venue.name : ''}</h1>
			<div class="d-flex justify-content-between">
				<a class="btn btn-secondary m-3" href="/venues">Back to Venue List</a>
			</div>
		</div>
		<form action="/venues/${venue.id }" method="get">
			<input type="date" name="date" required value="${date }"> <input
				type="hidden" name="venueId" value="${venue.id}"> <input
				type="submit" value="Check Price">
		</form>
		<hr>
		<h3>${venue.name}</h3>
		<p>City: ${venue.city}</p>
		<p>State: ${venue.state}</p>
		<p>Price: $${venue.price }</p>

		<h3>Selected Date: ${date}</h3>
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
		
		<a class="btn btn-primary" href="/catering/${venue.id }">Continue</a>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>Amenities</th>
					<th>Restrictions</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><c:forEach items="${venue.amenities}" var="amenity">
							<p>
								<i class="bi bi-check-lg"></i>${amenity}</p>
							<br>
						</c:forEach></td>
					<td><c:forEach items="${venue.restrictions}" var="restriction">
							<p>
								<i class="bi bi-x"></i>${restriction}</p>
							<br>
						</c:forEach></td>
				</tr>
			</tbody>
		</table>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>