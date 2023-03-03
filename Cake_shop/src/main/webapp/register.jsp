<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/styles.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<%@ include file="navbar.jsp" %>

    <main class="primary-background ">
    	<div class="container" style="padding-top:80px">
    		<div class="col-md-6 offset-md-3">
    			<div class="card">
    				<div class="card-header text-center">
    				  <span><img src="img/regi.jpg" style="height:60px"/></span>
    				   <br>
    				  Register Here..
    				</div>
    				<div class="card-body">
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
    </main>

	
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	$(document).ready(function()
   {
	  console.log("loaded.....")	
       
	  $('#reg-form').on('submit',function(event) 
	 {
		  event.preventDefault();
		  let form=new FormData(this);
		  
		  $.ajax
		  ({
			 url:"RegisterServlet",
			 type:'POST',
			 data:form,
			 success:function(data,textStatus,jqXHR)
			 {
				 console.log(data)
			
				 
				 if(data.trim()==='done')
				{	 
					 swal("Good job!", "Successfully Register", "success").then(){
						 window.location="login.jsp"
					 };
				}
				 else
					 {
					   swal(data);
					 }
			 }
			 error:function(jqXHR,textStatus,errorThrown)
			 {
				   console.log(jqXHR)
				  swal("ERROR", "Something went Wrong try again....", "error"); 
		
			 },
			 processData:false,
			 contentType:false
		  });
			  	  
	});
			  
	});
	
</script>
<br>	
<%@ include file="footer.jsp" %>

</body>
</html>