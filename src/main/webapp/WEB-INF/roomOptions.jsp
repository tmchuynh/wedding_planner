<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rooms</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container-fluid p-4">
		<div class="d-flex justify-content-between">
			<h1>Available Rooms for ${venue != null ? venue.name : ''}</h1>
			<div class="d-flex justify-content-between">
				<a class="btn btn-secondary m-3" href="/venues">Back to Venue List</a>
				<a class="btn btn-secondary m-3" href="/venues/${venue.id }">Pick Another Date</a>
			</div>
		</div>
	</div>

	<div class="container-fluid p-4">
		<h1>Room Options</h1>
		<hr>
		<c:if test="${not empty roomOptions}">
			<div class="row">
				<c:forEach items="${roomOptions}" var="room">
					<c:if test="${room.isAvailableOnDate(selectedDate)}">
						<div class="col-md-6 col-lg-4">
							<div class="room-card card">
								<div class="card-body">
									<h5 class="card-title">${room.type}</h5>
									<div class="room-details">
										<p>Capacity: ${room.capacity}</p>
										<p>Available on:</p>
										<ul>
											<c:forEach items="${room.availabilities}" var="availability"
												varStatus="status">
												<c:if test="${room.isAvailableOnDate(selectedDate)}">
													<li>${availability.date} - 
														${availability.roomsAvailable} rooms</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${empty roomOptions}">
			<p>No room options available for the selected date.</p>
		</c:if>
	</div>




</body>
</html>