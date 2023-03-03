<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
		.card-image
		{
			height:150px;
			padding:10px;
		}
	</style>
</head>
<body>
<div class=" card mt-3 ">
	<div class="row mt-3 ">
	<div class="col-md-2 col-sm-3">
	  <div class="card">
  	  <img src="imgss/cake1.jpg" class="card-img-top card-image" alt="...">
  	  <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="class-text">Rs.500/-</p>
       <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
  </div>
</div>


	<div class="col-md-2 col-sm-3">
	  <div class="card">
  	  <img src="imgss/cake4.jpg" class="card-img-top card-image" alt="...">
  	  <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="class-text">Rs.500/-</p>
       <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
  </div>
</div>

	<div class="col-md-2 col-sm-3">
	  <div class="card">
  	  <img src="imgss/cake3.jpg" class="card-img-top card-image" alt="...">
  	  <div class="card-body">
      <h5 class="card-title">Card title</h5>
    	<p class="class-text">Rs.500/-</p>
       <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
  </div>
</div>
	</div>

</div>

	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class=" card mt-3 ">
					<div class="row p-3 ">
						<div class="col-md-2 col-sm-3">
							<div class="card">
								<img src="imgss/cake1.jpg" class="card-img-top card-image"
									alt="...">
								<div class="card-body">
									<h5 class="card-title">Card title</h5>
									<p class="class-text">Rs.500/-</p>
									<a href="#" class="btn btn-primary">Go somewhere</a>
								</div>
							</div>
						</div>


						<div class="col-md-2 col-sm-3">
							<div class="card">
								<img src="imgss/cake4.jpg" class="card-img-top card-image"
									alt="...">
								<div class="card-body">
									<h5 class="card-title">Card title</h5>
									<p class="class-text">Rs.500/-</p>
									<a href="#" class="btn btn-primary">Go somewhere</a>
								</div>
							</div>
						</div>

						<div class="col-md-2 col-sm-3">
							<div class="card">
								<img src="imgss/cake3.jpg" class="card-img-top card-image"
									alt="...">
								<div class="card-body">
									<h5 class="card-title">Card title</h5>
									<p class="class-text">Rs.500/-</p>
									<a href="#" class="btn btn-primary">Go somewhere</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>




</body>
</html>