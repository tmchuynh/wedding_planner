<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Decorations</title>
			<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
			<link rel="stylesheet" type="text/css" href="/css/main.css">
			<link rel="stylesheet" type="text/css" href="/css/venue.css">
		</head>

		<body>
			<div class="container-fluid body-container p-4">
				<img src="/images/extra/photo2.png" alt="venue" class="image3">
				<img src="/images/extra/photo2.png" alt="venue" class="image4">
				<img src="/images/extra/photo2.png" alt="venue" class="image5">
				<img src="/images/extra/photo2.png" alt="venue" class="image6">
				<div class="d-flex justify-content-between">
					<h1 class="main">Decorations Available for ${venue != null ? venue.name : ''}</h1>
					<div class="d-flex justify-content-between mx-3">
						<a class="btn btn-secondary m-3" href="/venues">Back to Venue List</a>
						<a class="btn btn-secondary m-3" href="/catering/${venue.id }">Back to Catering Detail</a>
						<a class="btn btn-primary my-3" href="/rooms/${venue.id }">Continue</a>
					</div>
				</div>
				<div class="container-fluid">
					<div class="row">
						<c:forEach items="${decorOptions}" var="decoration">
							<div class="col-lg-4 col-md-6 col-sm-12">
								<div class="card decoration-card m-3">
									<img src="/images/decorations/${decoration.image}" alt="${decoration.name}"
										class="card-img-top" style="height: 15rem; object-fit: cover;">
									<div class="card-body">
										<h3 class="main card-title">${decoration.name}</h3>
										<p class="card-text">Type: ${decoration.type}</p>
										<p class="card-text">Dimensions: ${decoration.width}W x
											${decoration.height}H x ${decoration.depth}D</p>
										<p class="card-text">Fragile: ${decoration.fragile}</p>
										<p class="card-text">Fee: ${decoration.fee}</p>
										<p class="card-text">Quantity: ${decoration.quantity}</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

		</body>

		</html>