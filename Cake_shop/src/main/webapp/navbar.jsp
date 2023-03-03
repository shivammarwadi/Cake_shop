 <%@page import="com.cake.shop.entities.message"%>
<html>

<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/styles.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

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
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-phone"></span> Contact</a></li>
				 <li class="nav-item active"><a class="nav-link " href=""><span
						class="fa fa-inbox"></span> About</a></li>		
			    <li class="nav-item active"><a class="nav-link " href="" data-toggle="modal" data-target="#addloginModal"><span
						class="fa fa-user-plus"></span> Admin Login</a></li>
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
               <%
			        message m=(message)session.getAttribute("msg");
			    	if(m!=null)
			    	{
			   	%>
			   	
			    <div class="alert <%= m.getCssClass() %> m-2"  role="alert">
 				 <%= m.getContent() %>  
 				
				</div>
			    
			     <% 
			        session.removeAttribute("msg");
			    	}
			     %> 				
	
 
<!-- The  register Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header text center bg-primary">
        <h4 class="modal-title">Register Here..</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form id="reg-form" action="RegisterServlet1" method="POST">
    				     <div class="form-group">
						    <label for="user_name">User Name</label>
						    <input type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name" name="user_name">
						 </div>
						  
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="user_email">
						    <small id="emailHelp" class="form-text text-muted"></small>
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="user_password">
						  </div>
						  
					      <div class="form-group">
						    <label for="exampleInputPassword1">Select Gender</label><br>
						    <input type="radio" id="gender" name="gender" value="Male">Male
						     <input type="radio" id="gender" name="gender" value="Female">Female
						  </div>
						  
						  <div class="form-group">
						  	<textarea name="about" class="form-control"  rows="5" placeholder="Enter something about yourself"></textarea>	  
						  </div>
	  
						  <div class="form-check">
						    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="user_check">
						    <label class="form-check-label" for="exampleCheck1">Agree terms and condition</label>
						  </div><br>
						  <button type="submit" class="btn btn-outline-success float-right">Submit</button>
						  <button  class="btn btn-outline-warning float-right" style="margin-right:7px">Reset</button>
					 </form>
      </div>
    </div>
  </div>
</div>
	

<!-- The  Login Modal -->
<div class="modal" id="myloginModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header text center bg-primary">
        <h4 class="modal-title">Login Here..</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
           			

      <!-- Modal body -->
      <div class="modal-body">
       <form  id="log-form" action="LoginServlet" method="POST">
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
				  <button type="submit" class="btn btn-outline-success
				  ">Submit</button>				 
				  </div>
				</form>
      </div>
    </div>
  </div>
</div>


	<!-- Admin Login Modal -->
<div class="modal" id="addloginModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header text center bg-light">
        <h4 class="modal-title">Admin Login Here..</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
           		
      <!-- Modal body -->
      <div class="modal-body">
       <form action="adminServlet" method="POST">
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
				  <button type="submit" class="btn btn-outline-success">Submit</button>				 
				  </div>
				</form>
      </div>
    </div>
  </div>
</div>

	
<!-- <script type="text/javascript">$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})</script>	 -->
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	$(document).ready(function()
   {
	  console.log("page is ready.....")	
       
	  $('#reg-form').on('submit',function(event) 
	 {
		  event.preventDefault();
	      var form=$(this).serialize();
		  console.log(form);

		  $.ajax
		  ({
			 url:"RegisterServlet1",
			 type:'POST',
			 data:form,
			 success:function(data,textStatus,jqXHR)
			 {
				 console.log(data);
				 
				 if(data.trim()=="done")
				{	 
					
					 swal("Good job!", "Successfully Register!", "success");
					 window.location="index.jsp";
				}
				 else
					 {
					    swal(data);
					 }
			 },
			 error:function(jqXHR,textStatus,errorThrown)
			 {

				  console.log(jqXHR)
				  swal("ERROR", "Something went Wrong try again....", "error"); 
			 },
		  });
			  	  
	});
			  
	});

</script>
<script>
	
	$(document).ready(function()
   {
	  console.log("page is ready.....")	
       
	  $('#log-form').on('submit',function(event) 
	 {
		  event.preventDefault();
	      var form=$(this).serialize();
		  console.log(form);

		  $.ajax
		  ({
			 url:"LoginServlet",
			 type:'POST',
			 data:form,
			 success:function(data,textStatus,jqXHR)
			 {
				 console.log(data);
				 
				
					   if(data.trim()==="done")
						   {
						      swal("Successfully login!", "Please click on ok button..!", "success").then(function(){
						    		
							    	window.location="profile.jsp";
							    	});
						   }
					   else
						 {
					        swal("Error", "invalid", "danger");
					     }
			 },
			 error:function(jqXHR,textStatus,errorThrown)
			 {

				  console.log(jqXHR)
				  swal("ERROR", "Something went Wrong try again....", "error"); 
			 },
		  });
			  	  
	});
			  
	});

</script>
</body>
</html>
