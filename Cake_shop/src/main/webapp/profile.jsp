<%@page import="com.cake.shop.dao.PostDao"%>
<%@page import="com.cake.shop.entities.post"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.cake.shop.entities.User"%>
     <%@page import="com.cake.shop.helper.connection"%>
     <%@page import="java.util.ArrayList"%>
	   <%@page import="com.cake.shop.entities.category"%>
	   	  
<% 
  User user=(User)session.getAttribute("CurrentUser");
  if(user==null)
  {
	  response.sendRedirect("index.jsp");
  }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/styles.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.admin .card {
	border: 1px solid black;
}

.admin  .card-body:hover {
	background: lightgrey;
	cursor: pointer;
}
</style>
</head>
<body style="background-color:#f7faf8;">
	
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
			</ul>
			<ul class="navbar-nav mr-right">
			   <li class="nav-item active" ><a class="nav-link"
					href="#" ><span class="fa fa-shopping-cart"></span> Cart</a></li>	
				
				<li class="nav-item active"><a class="nav-link"
					href="#"><span class="fa fa-user-circle"></span> <%=user.getName() %> </a></li>

				<li class="nav-item active"><a class="nav-link"
					href="logoutServlet"><span class="fa fa-sign-out" ></span> Logout</a></li>
			</ul>
		</div>
	</nav><br><br>
  
  <!--card  -->
  <div class="container mt-4">
		<div class="row ">
			<div class="col-md-4">
				<div class="list-group">
					  <a href="#" onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action text-center  bg-dark text-white">Select-Category</a>
					  <%
		           		PostDao postd=new PostDao(connection.getConnection());
		           		ArrayList<category> list=postd.getAllCategories();
		           		for(category c:list)
		           		{
		               %>
                        	 <a href="#" onclick="getPosts(<%=c.getCid() %>,this)" class=" c-link list-group-item list-group-item-action"><%=c.getName()%></a>
		              	<% } %>
			   </div>
				<br>
			</div>



			<div class="col-md-8 admin">
					<div class="container" id="post-container"></div>
					
					</div>
					</div>
					</div>
					<br>
<!-- card end -->  
  
 
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
  <script>
	
	$(document).ready(function()
   {
	  console.log("page is ready.....")	
       
	  $('#log').on('click',function(event) 
	 {
		  $.ajax
		  ({
			 url:"logoutServlet",
			 type:'POST',
			 data:form,
			 success:function(data,textStatus,jqXHR)
			 {
				 console.log(data);
				 
				 if(data.trim()=='done')
				{	 
					
					 swal("Good job!", "Logout Successfully!", "success");
				}
				 else
					 {
					    swal(data);
					 }
			 },
		  });
			  	  
	});
			  
	});

</script>
<script>

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
</script>

	<%@ include file="footer.jsp"%>
</body>
</html>