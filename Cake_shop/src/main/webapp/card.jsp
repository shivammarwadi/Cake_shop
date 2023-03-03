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
<title>card</title>
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
<style>
.admin .card {
	border: 1px solid black;
}

.admin  .card-body:hover {
	background: lightgrey;
	cursor: pointer;
}
.card-image
		{
			height:100px;
			padding:10px;
		}
</style>
</head>
<body>

	<!--card  -->
	<div class="container mt-4">
		<div class="row ">
			<div class="col-md-4">
				<div class="list-group">
					<a href="#" onclick="getPosts(0,this)"
						class=" c-link list-group-item list-group-item-action text-center  bg-dark text-white">Select-Cake-Type</a>
					<%
					PostDao postd = new PostDao(connection.getConnection());
					ArrayList<category> list = postd.getAllCategories();
					for (category c : list) {
					%>
					<a href="#" onclick="getPosts(<%=c.getCid()%>,this)"
						class=" c-link list-group-item list-group-item-action"><%=c.getName()%></a>
					<%
					}
					%>
				</div>
				<br>
			</div>
			<div class="col-md-8">
				<div class="container-fluid" id="post-container">
					<%
					PostDao postcc = new PostDao(connection.getConnection());
					List<post> post = null;
					post = postcc.getAllPosts();
					if (post.size() == 0) {
						out.println("<h3 class='display-3 text-center'>No posts in this catergory...</h3>");
						return;
					}
					for (post pp : post) {
						String path = " imgss" + File.separator;
					%>
					<div class="col-md-4 mt-2">
						<div class="card">
						<img class="card-img-top card-image" src="<%=path%><%=pp.getpPic()%>"
								alt="Card image cap">
				
							<div class="card-body">
								<b><%=pp.getpTitle()%></b>
								<p><%=pp.getpContent()%></p>
								<p>Rs.<%=pp.getpCode()%></p>
							</div>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
          </div>
	</div>
	
	<br>
	<!-- card end -->
	<!-- <script>

function getPosts(catId,temp)
{
	$(".c-link").removeClass('active')

	 $.ajax({
		url:"load_post.jsp",
		data:{cid:catId},
		success:function(data,textStatus,jqXNR){
			console.log(data);
			$('#post-container').html(data)
			$(temp).addClass('active')
		}
   })	 

}
$(document).ready(function(e){ 
	 let allPostRef=$('.c-link')[0]
	 getPosts(0,allPostRef)
})
</script> -->
</body>
</html>