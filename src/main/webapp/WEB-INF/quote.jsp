<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Quote</title>
				<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
				<link rel="stylesheet" type="text/css" href="/css/main.css">
				<link rel="stylesheet" type="text/css" href="/css/venue.css">
			</head>

			<body>
				<div class="container-fluid body-container p-4">
					<img src="/images/extra/logo.png" alt="venue" class="logo">
					<img src="/images/extra/image4.png" alt="venue" class="image7">
					<div class="d-flex justify-content-between">
						<h1 class="danger">Your Quote for ${venue != null ? venue.name : ''} on ${date }</h1>
						<div class="d-flex justify-content-between">
							<a class="btn btn-danger m-3" href="/venues">Start Over</a>
						</div>
					</div>

					<div class="container-fluid">
						<h1>
							Estimated Total: <span class="estimatedTotal main">$0.00</span>
							<br>
							Estimated Food Cost: <span class="estimatedFood main">$0.00</span>
							<br>
							Estimated Hotel Cost: <span class="estimatedHotel main">$0.00</span>
						</h1>
						<c:if test="${price != null}">
							<p>
								<span style="font-weight: bold;">Reception Price:</span> $<span class="receptionPrice">${price.receptionStartingPrice}</span>
							</p>
							<p>
								<span style="font-weight: bold;">Ceremony Price:</span> $<span class="ceremonyPrice">${price.ceremonyStartingPrice}</span>
							</p>
							<p>
								<span style="font-weight: bold;">Bar Price:</span> $<span class="barPrice">${price.barStartingPrice}</span>
							</p>
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
								<tr class="danger">
									<th class="col-2">‎Name</th>
									<th class="col-1">City</th>
									<th class="col-1">State</th>
									<th class="col-1">Price</th>
									<th class="text-center col-1">Rating</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="col-2">${venue.name}${venue.id }</td>
									<td class="col-1">${venue.city}</td>
									<td class="col-1">${venue.state}</td>
									<td class="col-1 venuePrice main" style="font-weight: bold;">$${venue.price }</td>
									<td class="col-1 text-center">${venue.rating}</td>
								</tr>

								<tr>
									<td colspan="7"><img src="/images/venues/${venue.image }" alt="${venue.name }"
											style="width: 200px; height: 200px; object-fit: cover;"
											class="img-thumbnail my-3">
										<h3>Details:</h3>
										<table class="table">
											<thead>
												<tr class="danger">
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
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="container-fluid">
						<h1>Catering</h1>
						<table class="table">
							<thead>
								<tr class="danger">
									<th class="col-3">Catering Name</th>
									<th class="col-2">Staff Price</th>
									<th class="col-6">Available Foods</th>
									<th class="col-2"></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${catering.name}</td>
									<td class="col-3 main" style="font-weight: bold;" id="cateringPrice">$${catering.staff_price}</td>
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
									<th class="foodTotal main" style="font-weight: bold;">$0.00</th>
								</tr>
								<tr>
									<td colspan="7"><img src="/images/catering/${catering.image }"
											alt="${catering.name }"
											style="width: 200px; height: 200px; object-fit: cover;"
											class="img-thumbnail">
										<table class="table">
											<thead>
												<tr class="danger">
													<th class="col-1"></th>
													<th class="col-2">Name</th>
													<th class="col-7">Description</th>
													<th class="col-2">Price</th>
													<th class="col-3"></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${catering.availableFoods}" var="food">
													<tr>
														<td><img src="/images/food/${food.image }" alt="${food.name }"
																style="width: 150px; height: 150px; object-fit: cover;"
																class="img-thumbnail"></td>
														<td>${food.name}</td>
														<td>${food.description}</td>
														<td class="main" style="font-weight: bold;">$${food.price}</td>
														<td><input type="number" class="col-xs-2 form-control"
																style="width: 4rem;" value="0"
																onchange="updateTotalPrice(this)"
																data-previous-value="0">
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="container-fluid p-4">
						<div class="d-flex justify-content-between">
							<h1>Room Options</h1>
							<h5 class="roomTotal mt-auto main" style="font-weight: bold;">$0.00</h5>
						</div>
						<hr>
						<c:if test="${not empty roomOptions}">
							<div class="row">
								<c:forEach items="${roomOptions}" var="room">
									<c:if test="${room.isAvailableOnDate(selectedDate)}">
										<div class="col-md-6 col-lg-4">
											<div class="room-card card m-3">
												<img src="/images/rooms/${room.image}" alt="${room.name}"
													class="card-img-top" style="height: 15rem; object-fit: cover;">
												<div class="card-body">
													<h5 class="card-title danger" style="text-transform: uppercase;">
														${room.type}</h5>
													<div class="room-details">
														<p><span style="font-weight: bold;">Capacity:</span> ${room.capacity}</p>
														<p style="text-transform: uppercase;">Available on:</p>
														<input type="hidden" name="id" class="roomId"
															value="${room.id}">
														<c:set var="availableRooms"
															value="${room.getAvailableRoomsOnDate(selectedDate)}" />
														<c:if test="${not empty availableRooms}">
															<c:forEach items="${availableRooms}" var="availableRoom">
																<ul>
																	<li><span style="font-weight: bold;">Date:</span> ${availableRoom.date}</li>
																	<li><span style="font-weight: bold;">Rooms Available:</span> <span
																			class="roomsAvailable">${availableRoom.roomsAvailable}</span>
																	</li>
																	<li><span style="font-weight: bold;">Price per Night:</span> <span
																			class="pricePerNight main" style="font-weight: bold;">$${availableRoom.pricePerNight}</span>
																	</li>
																</ul>
															</c:forEach>
															<div class="d-flex justify-content-center">
																<div class="d-flex justify-content-between">
																	<label class="danger mx-5 my-auto" style="font-weight: bold;">Nights:</label>

																	<input type="number" class="col-xs-2 form-control"
																		style="width: 4rem;" value="0"
																		id="numberOfNights" onchange="checkNights(this)"
																		data-previous-value="0">
																</div>
																<div class="d-flex justify-content-between">
																	<label class="danger mx-5 my-auto" style="font-weight: bold;">Rooms:</label>

																	<input type="number" class="col-xs-2 form-control"
																		style="width: 4rem;" value="0"
																		onchange="updateRooms(this)"
																		data-previous-value="0">
																</div>

															</div>
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



				</div>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
					crossorigin="anonymous" type="text/javascript"></script>
				<script src="https://code.jquery.com/jquery-3.6.0.min.js" type="text/javascript"></script>
				<script src="/js/accordion.js" type="text/javascript"></script>
				<script>
					document.addEventListener('DOMContentLoaded', function () {
						calculateEstimatedTotal()
					});

					function calculateEstimatedTotal() {
						var reception = parseFloat(document.querySelector('.receptionPrice').innerHTML);
						var ceremony = parseFloat(document.querySelector('.ceremonyPrice').innerHTML);
						var bar = parseFloat(document.querySelector('.barPrice').innerHTML);
						var venue = parseFloat(document.querySelector('.venuePrice').innerHTML.slice(1));
						var food = parseFloat(document.querySelector('.foodTotal').innerHTML.slice(1));
						var room = parseFloat(document.querySelector('.roomTotal').innerHTML.slice(1));
						var staff = parseFloat(document.querySelector('#cateringPrice').innerHTML.slice(1));

						var estimatedTotal = reception + ceremony + bar + venue + food + room + staff;

						document.querySelector('.estimatedTotal').innerHTML = "$" + estimatedTotal.toFixed(2);
						document.querySelector('.estimatedFood').innerHTML = "$" + food;
						document.querySelector('.estimatedHotel').innerHTML = "$" + room;
					}

					// Updates the total price of a food item based on its quantity.
					// 
					// input: the input element that contains the quantity of the food item
					// 
					// returns: nothing
					function updateTotalPrice(input) {
						var price = parseFloat(input.parentNode.previousElementSibling.innerHTML.slice(1));
						var quantity = parseInt(input.value);
						var totalPrice = price * quantity;

						var currentPrice = parseFloat(document.querySelector('.foodTotal').innerHTML.slice(1));
						var estimatedTotal = parseFloat(document.querySelector('.estimatedTotal').innerHTML);

						// Check if the quantity is not negative and handle decrease in value
						if (quantity >= 0) {
							var updatedPrice = currentPrice + totalPrice;
							if (quantity < input.dataset.previousValue) {
								updatedPrice -= price * (input.dataset.previousValue - quantity);
							}
							document.querySelector('.foodTotal').innerHTML = '$' + updatedPrice.toFixed(2);
							calculateEstimatedTotal();
							input.dataset.previousValue = quantity;
						} else {
							// Reset the input value to the previous value if a negative number is entered
							input.value = input.dataset.previousValue;
						}
					}

					/**
					 * Updates the displayed room total based on the number of nights entered.
					 * If the number of nights entered is negative, the previous value is restored and the room total is set to $0.00.
					 * 
					 * @param {HTMLInputElement} input - the input element containing the number of nights entered
					 */
					function checkNights(input) {
						var nights = parseInt(input.value);

						if (nights < 0) {
							input.value = input.dataset.previousValue;
							document.querySelector('roomTotal').innerHTML = '$0.00';
						}
					}
					// Updates the total price for a hotel room based on the number of rooms and nights entered.
					// 
					// @param {Object} input - The input element containing the number of rooms entered.
					// 
					// @returns {void}
					function updateRooms(input) {
						var rooms = parseInt(input.value);
						var pricePerNight = parseFloat(document.querySelector('.pricePerNight').innerHTML.slice(1));
						var roomsAvailable = parseInt(document.querySelector('.roomsAvailable').innerHTML);
						var nights = parseInt(document.querySelector('#numberOfNights').value);

						var currentPrice = parseFloat(document.querySelector('.roomTotal').innerHTML.slice(1));

						// Check if the number of rooms is within the available rooms and is not negative
						if (rooms >= 0 && rooms <= roomsAvailable && nights >= 0) {
							var updatedPrice = currentPrice;

							if (rooms < input.dataset.previousValue) {
								var removedRooms = input.dataset.previousValue - rooms;
								updatedPrice -= pricePerNight * nights * removedRooms;
							} else if (rooms > input.dataset.previousValue) {
								updatedPrice += pricePerNight * nights * (rooms - input.dataset.previousValue);
							}

							document.querySelector('.roomTotal').innerHTML = '$' + updatedPrice.toFixed(2);
							calculateEstimatedTotal();
							input.dataset.previousValue = rooms;
						} else {
							// Reset the input value to the previous value if a negative number is entered
							document.querySelector('.roomTotal').innerHTML = '$0.00';
							input.value = input.dataset.previousValue;
							document.querySelector('#numberOfNights').value = document.querySelector('#numberOfNights').dataset.previousValue;
						}
					}



				</script>
			</body>

			</html>