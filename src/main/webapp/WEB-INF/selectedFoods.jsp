<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1>Selected Foods</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Food Name</th>
					<th>Venue Name</th>
					<th>Venue Address</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${selectedFoods}" var="selectedFood">
					<tr>
						<td>${selectedFood.food.name}</td>
						<td>${selectedFood.venue.name}</td>
						<td>${selectedFood.venue.address}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>