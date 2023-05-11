<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/accordian.css">
</head>
<body>
	<h1>Wedding Planner</h1>
	<h2>Venues</h2>
	<table class="table">
		<thead>
			<tr>
				<th>Name</th>
				<th>Address</th>
				<th>City</th>
				<th>Zip Code</th>
				<th>Price per Hour</th>
				<th>Available From</th>
				<th>Available To</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${venueList}" var="venue">
				<tr class="accordion">
					<td><span class="arrow">&#x25B6;</span> ${venue.name}</td>
					<td>${venue.address}</td>
					<td>${venue.city}</td>
					<td>${venue.zip_code}</td>
					<td>${venue.pricePerHour}</td>
					<td>${venue.formattedFromDate}</td>
					<td>${venue.formattedToDate}</td>
				</tr>
				<tr class="accordion-content">
					<td colspan="7">
						<h3>Available Foods:</h3>
						<table>
							<thead>
								<tr>
									<th>Name</th>
									<th>Description</th>
									<th>Price</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${venue.availableFoods}" var="food">
									<tr>
										<td>${food.name}</td>
										<td>${food.description}</td>
										<td>${food.price}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.accordion').click(function() {
				$(this).find('.arrow').text(function(_, text) {
					return text === '▼' ? '▶' : '▼';
				});
				$(this).next('.accordion-content').slideToggle();
			});
		});
	</script>


</body>
</html>