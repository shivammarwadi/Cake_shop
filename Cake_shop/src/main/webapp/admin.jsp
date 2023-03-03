<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	  <%@page import="com.cake.shop.entities.User"%>
	   	   <%@page import="com.cake.shop.dao.PostDao"%>
	   	<%@page import="com.cake.shop.helper.connection"%>
<%@page import="java.util.ArrayList"%>
	   <%@page import="com.cake.shop.entities.category"%>
	   	  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin_page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/styles.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
.admin .card{
	border: 2px solid blue;	
}
.admin  .card:hover{
   background:#e2e2e2;
   cursor: pointer;
}
</style>
</head>
<body>
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
			   <li class="nav-item active"><a class="nav-link"
					href="#" ><span class="fa fa-shopping-cart"></span></a></li>	
				
				<li class="nav-item active"><a class="nav-link"
					href="#"><span class="fa fa-user-circle"></span></a></li>

				<li class="nav-item active"><a class="nav-link"
					href="#" id="log"><span class="fa fa-sign-out" ></span> Logout</a></li>
			</ul>
		</div>
	</nav>
    

	<div class="container admin">
		
		<div class="row " style="margin-top:70px">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
					<div class="container">
						<img src="img/users.png" alt="" class="img-fluid" style="max-width:125px;"> 
						</div>
						<h1>Orders</h1>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
					<div class="container">
						<img src="img/cat.png" alt="" class="img-fluid" style="max-width:125px;"> 
						</div>
						<h1>Delete Categories</h1>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img src="img/pro.png" alt="" class="img-fluid" style="max-width:125px;"> 
						</div>
						<h1>Delete Products</h1>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#exampleModal">
					<div class="card-body text-center">
						<div class="container">
							<img src="img/addcat.png" alt="" class="img-fluid" style="max-width: 125px;">
						</div>

						<h4>click here to add category</h4>
						<h1>Add Category</h1>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#productModal">
					<div class="card-body text-center">
						<div class="container">
						  <img src="img/addpro.png" alt="" class="img-fluid" style="max-width: 125px;">
						</div>

						<h4>click here to add product</h4>
						<h1>Add products</h1>
					</div>
				</div>
			</div>

		</div>

	</div>
<br>
<%@ include file="footer.jsp" %>	
<!-- cat modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill category detail</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <form action="AddCatServlet" method="post" id="add-cat-form" >
        
        	<div class="form-group">
        		<input type="text" name="cat" placeholder="enter categories" class="form-control"/>
        	</div>
        	   	
        	<div class="form-group">
        		<input type="text" placeholder="(Optional)" name="dec" class="form-control" />
        	</div>
        	
        	<div class="container text-center">
        		<button type="submit" class="btn btn-outline-primary">Upload</button>
        	</div>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- cat modal end -->

<!-- pro modal -->
<!-- Modal -->
<div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="exampleModalLabel">Add Products</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="AddPostServlet" method="post" id="add-post-form" >
          <div class="form-group">
           <select class="form-control" name="cid">
           	<option selected disabled>----Select Categories----</option>
				<%
           		PostDao postd=new PostDao(connection.getConnection());
           		ArrayList<category> list=postd.getAllCategories();
           		for(category c:list)
           		{
               %>
		           	<option value="<%= c.getCid() %>"><%= c.getName() %></option> 
              	<% } %>
           </select>         
          </div>
          
          
        	<div class="form-group">
        		<input type="text" name="pTitle" placeholder="enter post title" class="form-control"/>
        	</div>
        	
         	<div class="form-group">
        		<textarea placeholder="enter your content" name="pContent" class="form-control" style="height:200px"></textarea>
        	</div>
        	
        	<div class="form-group">
        		<input type="text" placeholder="enter your price" name="pCode" class="form-control" />
        	</div>
        	
            <div class="form-group">
             <lable>Choose your file</lable><br>
        	 <input type="file" name="pic"/>
        	</div>
       
        	<div class="container text-center">
        		<button type="submit" class="btn btn-outline-primary">Upload</button>
        	</div>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- pro modal end -->

   <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
<script>
		$(document).ready(function(){
			$("#add-post-form").on("submit",function(event){
		
				event.preventDefault();
				console.log("sucess");
				let form=new FormData(this);
				
				$.ajax({
					url:"AddPostServlet",
					type:'POST',
				    data:form,
				success:function(data,texStatus,jqXHR)
				{
					
					 console.log(data);
		        	 if(data.trim() == "done")
						{
					    	swal("Good job!", "Saved Successfully!", "success").then(function(){
						    	window.location="admin.jsp";
						    	});;
						}
					else
						{
					    	swal("Error!", "Something went Wrong try again....!", "error");
						}
				
				},
				error:function(jqXHR,texStatus,errorThrown)
				{
					swal("Error!", "Something went Wrong try again....!", "error");
				},
				processData:false,
				contentType:false
				})
			})	
		})

	</script>
	
	<!-- <script>
		$(document).ready(function(){
			$("#add-cat-form").on("submit",function(event){
		
				event.preventDefault();
				let form=new FormData(this);
				
				$.ajax({
					url:"AddCatServlet",
					type:'POST',
				    data:form,
				success:function(data,texStatus,jqXHR)
				{
					console.log(data);
		        	 if(data.trim() == "done")
						{
					    	swal("Good job!", "Saved Successfully!", "success").then(function(){
					    		
						    	window.location="admin.jsp";
						    	});;
						}
					else
						{
					    	swal("Error!", "Something went Wrong try again....!", "error");
						}
				
				},
				error:function(jqXHR,texStatus,errorThrown)
				{
					console.log(jqXHR);
					console.log(errorThrown);
					swal("Error4555555!", "Something went Wrong try again....!", "error");
				},
				processData:false,
				contentType:false
				})
			})	
		})

	</script> -->
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

</body>
</html>