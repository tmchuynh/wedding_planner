<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Rooms</title>
			<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
			<link rel="stylesheet" type="text/css" href="/css/main.css">
			<link rel="stylesheet" type="text/css" href="/css/venue.css">
		</head>

		<body>

			<div class="container-fluid p-4">
				<div class="d-flex justify-content-between">
					<h1 class="danger">Available Rooms for ${venue != null ? venue.name : ''}</h1>
					<div class="d-flex justify-content-between">
						<a class="btn btn-secondary m-3" href="/venues">Back to Venue
							List</a> <a class="btn btn-secondary m-3" href="/venues/${venue.id }">Pick
							Another Date</a>
						<a class="btn btn-primary m-3" href="/quote/${venue.id }">Continue</a>
					</div>
				</div>
			</div>

			<div class="container-fluid body-container">
				<img src="/images/extra/image3.png" alt="venue" class="image1">
				<c:if test="${not empty roomOptions}">
					<div class="row">
						<c:forEach items="${roomOptions}" var="room">
							<!-- Displays only the room available for the selected date -->
							<c:if test="${room.isAvailableOnDate(selectedDate)}">
								<div class="col-md-6 col-lg-4">
									<div class="room-card card m-3">
										<img src="/images/rooms/${room.image}" alt="${room.name}" class="card-img-top"
											style="height: 15rem; object-fit: cover;">
										<div class="card-body">
											<h5 class="card-title danger" style="text-transform: uppercase;">${room.type}
											</h5>
											<div class="room-details">
												<p><span style="font-weight: bold;">Capacity:</span> ${room.capacity}</p>
												<p style="text-transform: uppercase;">Available on:</p>
												<input type="hidden" name="id" class="roomId" value="${room.id}">
												<c:set var="availableRooms"
													value="${room.getAvailableRoomsOnDate(selectedDate)}" />
												<c:if test="${not empty availableRooms}">
													<c:forEach items="${availableRooms}" var="availableRoom">
														<ul>
															<li><span style="font-weight: bold;">Date:</span> ${availableRoom.date}</li>
															<li><span style="font-weight: bold;">Rooms Available:</span> ${availableRoom.roomsAvailable}</li>
															<li><span style="font-weight: bold;">Price per Night:</span> <span class="main" style="font-weight: bold;">$${availableRoom.pricePerNight}</span></li>
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
			</div>
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>





		</body>

		</html>