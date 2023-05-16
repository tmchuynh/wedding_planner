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
				<a class="btn btn-secondary m-3" href="/venues">Back to Venue
					List</a> <a class="btn btn-secondary m-3" href="/venues/${venue.id }">Pick
					Another Date</a>
			</div>
		</div>
	</div>

	<div class="container-fluid p-4">
		<h1>Room Options</h1>
		<hr>
		<c:if test="${not empty roomOptions}">
			<div class="row">
				<c:forEach items="${roomOptions}" var="room">
					<!-- Displays only the room available for the selected date -->
					<c:if test="${room.isAvailableOnDate(selectedDate)}">
						<div class="col-md-6 col-lg-4">
							<div class="room-card card m-3">
							<img src="/images/rooms/${room.image}"
							alt="${room.name}" class="card-img-top" style="height: 15rem; object-fit: cover;">
								<div class="card-body">
									<h5 class="card-title">${room.type}</h5>
									<div class="room-details">
										<p>Capacity: ${room.capacity}</p>
										<p>Available on:</p>
										<c:set var="availableRooms"
											value="${room.getAvailableRoomsOnDate(selectedDate)}" />
										<c:if test="${not empty availableRooms}">
											<c:forEach items="${availableRooms}" var="availableRoom">
												<ul>
													<li>Date: ${availableRoom.date}</li>
													<li>Rooms Available: ${availableRoom.roomsAvailable}</li>
												</ul>
											</c:forEach>
										</c:if>
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