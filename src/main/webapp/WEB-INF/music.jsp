<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wedding Planner</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/accordian.css">
</head>
<body>
	<div class="container-fluid p-4">
		<h1>Wedding Planner</h1>
		<h2>Music</h2>
		<div class="filter py-3">
			<!-- Filter by Music Type dropdown -->
			<div class="form-group">
				<label for="musicType">Filter by Music Type:</label> <select
					class="form-control" id="musicType">
					<option value="">All</option>
					<c:forEach items="${musicTypes}" var="type">
						<option value="${type}">${type}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>Name</th>
					<th>Type</th>
					<th>Price per Hour</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${musicList}" var="music">
					<tr class="accordion" data-restrictions="${music.type }">
						<td><span class="arrow">&#x25B6;</span>${music.name}</td>
						<td>${music.type}</td>
						<td>$${music.pricePerHour}</td>
					</tr>
					<tr class="accordion-content">
						<td colspan="7">
							<h3>Available Songs:</h3>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Title</th>
										<th>Length</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${music.availableSongs}" var="song">
										<tr>
											<td>${song.title}</td>
											<td>${song.length}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/js/music.js"></script>
</body>
</html>
