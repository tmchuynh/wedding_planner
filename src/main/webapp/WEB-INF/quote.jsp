<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quote</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container-fluid p-4">
		<div class="d-flex justify-content-between">
			<h1>Your Quote for ${venue != null ? venue.name : ''} on ${date }</h1>
			<div class="d-flex justify-content-between">
				<a class="btn btn-secondary m-3" href="/venues">Start Over</a>
			</div>
		</div>

		<div class="container-fluid">
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
		</div>

		<div class="container-fluid">
			<table class="table">
				<thead>
					<tr>
						<th>‎Name</th>
						<th>City</th>
						<th>State</th>
						<th class="text-center">Rating</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="col-2">${venue.name} ${venue.id }</td>
						<td class="col-1">${venue.city}</td>
						<td class="col-1">${venue.state}</td>
						<td class="col-1 text-center">${venue.rating}</td>
						<td class="col-1 text-center"><a class="btn btn-primary"
							href="/venues/${venue.id}">Continue</a></td>
					</tr>

					<tr>
						<td colspan="7"><img src="/images/venues/${venue.image }"
							alt="${venue.name }"
							style="width: 200px; height: 200px; object-fit: cover;"
							class="img-thumbnail my-3">
							<h3>Details:</h3>
							<table class="table">
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
										<td><c:forEach items="${venue.restrictions}"
												var="restriction">
												<p>
													<i class="bi bi-x"></i>${restriction}</p>
												<br>
											</c:forEach></td>
									</tr>
								</tbody>
							</table></td>
					</tr>
				</tbody>
			</table>
		</div>


	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		type="text/javascript"></script>
	<script src="/js/accordion.js" type="text/javascript"></script>
</body>
</html>