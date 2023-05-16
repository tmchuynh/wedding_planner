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
								<img src="/images/rooms/${room.image}" alt="${room.name}"
									class="card-img-top" style="height: 15rem; object-fit: cover;">
								<div class="card-body">
									<h5 class="card-title" style="text-transform: uppercase;">${room.type}</h5>
									<div class="room-details">
										<form class="roomOptionsForm" action="/rooms/options"
											method="post">
											<p>Capacity: ${room.capacity}</p>
											<p>Available on:</p>
											<input type="hidden" name="id" class="roomId"
												value="${room.id}">
											<c:set var="availableRooms"
												value="${room.getAvailableRoomsOnDate(selectedDate)}" />
											<c:if test="${not empty availableRooms}">
												<c:forEach items="${availableRooms}" var="availableRoom">
													<ul>
														<li>Date: ${availableRoom.date}</li>
														<li>Rooms Available: ${availableRoom.roomsAvailable}</li>
														<li>Price per Night: $${availableRoom.pricePerNight}</li>
													</ul>
													
													<input type="hidden" id="quantity" name="quantity"
														value="0">
													<div class="input-group">
														<span class="input-group-btn">
															<button type="button" class="btn btn-danger btn-number"
																data-type="minus" data-field="quant[2]">-</button>
														</span> <input type="text" name="quant[2]"
															class="form-control input-number" value="0" min="0"
															max="${availableRoom.roomsAvailable}"
															onchange="updateQuantity(this.value)"> <span
															class="input-group-btn">
															<button type="button" class="btn btn-success btn-number"
																data-type="plus" data-field="quant[2]">+</button>
														</span>
													</div>
												</c:forEach>
											</c:if>
											<button class="btn btn-primary m-3" type="submit">Continue</button>
										</form>

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

	<script>
		window.addEventListener("DOMContentLoaded",
				function() {
					var initialValue = document
							.querySelector("input[name='quant[2]']").value;
					updateQuantity(initialValue);
				});
		$(document).ready(function() {
			$('.btn-number').click(function(e) {
				e.preventDefault();

				var fieldName = $(this).attr('data-field');
				var type = $(this).attr('data-type');
				var input = $(this).closest('.input-group').find('input');
				var currentVal = parseInt(input.val());

				if (!isNaN(currentVal)) {
					if (type == 'minus') {
						if (currentVal > input.attr('min')) {
							input.val(currentVal - 1).change();
						}
						if (parseInt(input.val()) == input.attr('min')) {
							$(this).attr('disabled', true);
						}

					} else if (type == 'plus') {
						if (currentVal < input.attr('max')) {
							input.val(currentVal + 1).change();
						}
						if (parseInt(input.val()) == input.attr('max')) {
							$(this).attr('disabled', true);
						}
					}
				} else {
					input.val(0);
				}
			});

			function updateQuantity(value) {
				document.getElementById("quantity").value = value;
			}

			$('.roomOptionsForm').submit(function() {
				var quantity = $('#quantity').val();
				var roomID = $('.roomId').val();
				var action = '/rooms/options/' + roomID + '/' + quantity;
				$(this).attr('action', action);
			});
		});
	</script>





</body>
</html>