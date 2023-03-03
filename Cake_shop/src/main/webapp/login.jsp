
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.cake.shop.entities.message"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/styles.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body style="background-color: #f0f1f2;">
<div>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
		<a class="navbar-brand active" href="index.jsp"><img src="img/logo1.png"
			style="width: 30%; height: 30px; background: white;"> Cake_Shop</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><span class="fa fa-home"></span> Home </a></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-phone"></span> Contact</a></li>

				<li class="nav-item"><a class="nav-link " href="login_page.jsp"><span
						class="fa fa-user-circle"></span> Login</a></li>
				<li class="nav-item"><a class="nav-link " href="register.jsp"><span
						class="fa fa-user-plus"></span> Sign-up</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<button type="button" class="btn btn-outline-light my-2 my-sm-0" data-toggle="modal" data-target="#myloginModal"  style="margin-right:5px">
					<span class="fa fa-user-circle"></span> Log-in
				</button>

				<button type="button" class="btn btn-outline-light my-2 my-sm-0"
					data-toggle="modal" data-target="#myModal" >
					<span class="fa fa-user-circle"></span> Sign-up
				</button>
			</form>
		</div>
	</nav>
 </div>
  
  <main class="d-flex align-items-center" style="height:70vh">
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header primary-background text-white text-center">
					<span class="fa fa-user-plus fa-3x"></span>
					<br>
					<p>Login here</p>
				    </div>
			      <%
			        message msg=(message)session.getAttribute("msg");
			    	if(msg!=null)
			    	{
			   	%>
			   	
			    <div class="alert <%= msg.getCssClass() %>" role="alert">
 				 <%= msg.getContent() %>  
 				
				</div>
			    
			     <% 
			        session.removeAttribute("msg");
			    	}
			     %> 		
	
			<div class="card-body">
				 
				<form action="LoginServlet" method="POST">
				  <div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email" required>
				    <small id="emailHelp" class="form-text text-muted"></small>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Password</label>
				    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="pass" required>
				  </div>
				  <div class="container text-center">
				  <button type="submit" class="btn btn-primary">Submit</button>				 
				  </div>
				</form>
			</div>
			</div>
			</div>
		</div>
	</div>  
  </main>




<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>