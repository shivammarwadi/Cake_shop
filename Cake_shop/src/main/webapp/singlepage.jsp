<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.cake.shop.entities.User"%>
<%@page import="com.cake.shop.helper.connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.cake.shop.entities.category"%>
<%@page import="com.cake.shop.dao.PostDao"%>
<%@page import="com.cake.shop.entities.post"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>single page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/styles.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
<!--navbar start  -->
<% 
  User user=(User)session.getAttribute("CurrentUser");
  if(user==null)
  {
	  response.sendRedirect("index.jsp");
  }

%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<a class="navbar-brand active" href="index.jsp"><img src="img/logo1.png"
			style="width: 30%; height: 30px; background: white;"> Cake_Shop</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><span class="fa fa-home"></span> Home </a></li>
					<li class="nav-item active"><a class="nav-link" href="profile.jsp"
					href="index.jsp"><span class="fa fa-backward"></span>  Back </a></li>
			</ul>
			<ul class="navbar-nav mr-right">
			   <!-- <li class="nav-item active"><a class="nav-link"
					href="#" ><span class="fa fa-shopping-cart"></span></a></li>	 -->
				
				<li class="nav-item active"><a class="nav-link"
					href="#"><span class="fa fa-user-circle"></span> <%=user.getName() %></a></li>

				<li class="nav-item active"><a class="nav-link"
					href="#" id="log"><span class="fa fa-sign-out" ></span> Logout</a></li>
			</ul>
		</div>
	</nav>

<!--navbar End  -->
<%
    User use=(User)session.getAttribute("CurrentUser");
		if(use==null)
		{
			  response.sendRedirect("index.jsp");
		}
	%>


 <%
	String path2 = "imgss" + File.separator;
	int pid = Integer.parseInt(request.getParameter("pid"));
	PostDao pda = new PostDao(connection.getConnection());
	post p = pda.getproductById(pid);
	%>
	<main class="container fluid text center my-3" style="padding-top:60px">
		<div class="row">
			<div class="col-md-6 text-center">
				<img class="img-fluid" src="<%=path2%><%=p.getpPic()%>"
					style="height: 430px;" alt="no image found"> <br> 
					<%-- <%
					if(use==null){
						%>
					<a id="nonuser"
					class="btn btn-warning  text-white my-3"><i
					class="material-icons left">shopping_cart</i>Add to cart</a>
						<%
					}else{
							%>
						
					<a onclick="addcart(<%=use.getId()%>,<%=p.getPid()%>)"
					class=" btn btn-warning text-white my-3"><i
					class="material-icons left">shopping_cart</i>Add to cart</a>
					<% 	
					}
					%> --%>
					

			</div>
			<div class="col-md-6">
				
					<p class="text-left" style="font-size: 30px;"><%=p.getpTitle()%></p>
					<div class="img-rate  text-left display-6">
						<a class=" btn mr-2 btn-success text-white my-3">Buy now</a> 
						<b><%=p.getpCode()%> Rs</b>
	                
					</div>
					<%-- <div class="img-content text-left" style="font-size: 25px;">
						<%=p.getpContent()%>
					</div>
					<br> <br --%>
					<div class="img-description text-left" style="font-size: 25px;">
						AKmart provides all the veriety of products whichever and whatever
						you wanted it is available in this and we are also available here
						if there is any problem with the product.</div>
					
				</div>
			
		</div>
	</main>
	<%@ include file="footer.jsp"%>
</body>
</html>