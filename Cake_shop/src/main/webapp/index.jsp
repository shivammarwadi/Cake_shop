<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cake.shop.entities.category"%>
<%@page import="com.cake.shop.dao.PostDao"%>
<%@page import="com.cake.shop.entities.post"%>
<%@page import="com.cake.shop.helper.connection"%>
<%@page import="java.io.File"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>index_Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/styles.css" rel="stylesheet">
<link href="js/index.js" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
  href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
<style>

.admin  .card:hover{
   cursor: pointer;
   border: 1px solid black;
}
.card-image
{ 
   height:150px;
   padding:10px;
}		
.card-im
{
   height:250px;
   padding:15px;
}
.swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 80px%;
        height: 70px%;
        object-fit: cover;
      }
      .aboimg{
  	width: 100%;
  	height: 240px!important;
	}
  .caimg
 {
 	  width: 100%;
  	height: 120px!important;
 }
</style>
</head>
<body style="background-color:#f7faf8;">

		<div>
			<%@ include file="navbar.jsp"%>
		</div>
		
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel" >
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="img/bg3.jpeg" alt="First slide"
						style="width: 100%; height: 450px;">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="img/bg2.jpg" alt="Second slide"
						style="width: 100%; height: 450px;">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="img/bg1.jpeg" alt="Third slide"
						style="width: 100%; height: 450px;">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div><br>
		
	   <section class="my-2" id="about">
			<div class="py-4 text-center">
			<h1 class="text-center" style="font-style:italic;font-weight:bolder;text-shadow:2px 1px 3px blue;">About Us</h1>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-5 col-md-5 col-12">
						<img src="imgss/ab.jpg" class="img-fluid aboimg">
					</div>
					<div class="col-lg-7 col-md-7 col-12">
						 <h4 class="display-6"><u>Cake</u></h4>
						 <p class="py-2">Cake is a form of sweet food made from flour, sugar, and other ingredients, that is usually baked. In their oldest forms, cakes were modifications of bread, but cakes now cover a wide range of preparations that can be simple or elaborate, and that share features with other desserts such as pastries, meringues, custards, and pies.</p>
						 <a href="about" class="btn btn-success">check more..</a>
					</div>
				</div>	
			</div><br><br>
<!-- About End -->


	<!-- main body of the page end -->
<h1 class="text-center" style="font-style:italic;font-weight:bolder;text-shadow:2px 1px 3px blue;">Products</h1>
<!-- 	<div class=" card mt-3 ">
		<div class="row mt-3 ">
		   <div class=" " id="post-container"></div>
		</div>

	</div> -->

 <!-- <div class=" " style="height:250px;">
      <div class="swiper-wrapper col-lg-4 col-md-4 col-12">
        <div class="swiper-slide"><img src="imgss/cake6.jpg" class="img-fluid"></div>
        <div class="swiper-slide"><img src="imgss/cake7.jpg" class="img-fluid"></div>
        <div class="swiper-slide"><img src="imgss/cake8.jpg" class="img-fluid"></div>
        <div class="swiper-slide"><img src="imgss/cake9.jpg" class="img-fluid"></div>
        <div class="swiper-slide"><img src="imgss/cake5.jpg" class="img-fluid"></div>
        <div class="swiper-slide"><img src="imgss/cake3.jpg" class="img-fluid"></div>
      </div>
      <div class="swiper-pagination"></div>
    </div> -->
   <div class="container-fluid pt-4">
				<div class="row">
					<div class="col-lg-3 col-md-4 col-12">
						<img src="imgss/cake6.jpg" class="img-fluid aboimg"><br>
					</div>
						<div class="col-lg-3 col-md-4 col-12">
						<img src="imgss/cake7.jpg" class="img-fluid aboimg"><br>
					</div>
						<div class="col-lg-3 col-md-4 col-12">
						<img src="imgss/cake8.jpg" class="img-fluid aboimg"><br>
					</div>
						<div class="col-lg-3 col-md-4 col-12">
						<img src="imgss/cake9.jpg" class="img-fluid aboimg"><br>
					</div>
				</div>
	</div>				
      	    
</br></br>
<!--  -->

<section>
	<div class="container-fluid  pt-3 pb-3" id="symid">
	      	<div class="section_header text-center mb-3 mt-2">
	      		<h1 style="font-style:italic;font-weight:bolder;text-shadow:2px 1px 3px  blue ">Our Services</h1>
	      	</div>
	        
        <div class="container">
        	<div class="row">
        		<div class="col-lg-4 col-md-4 col-12 mt-4">
        			<figure class="text-center">
        			<img src="imgss/deli.png" class="img-fluid" width="120" height="120">
        			<figcaption style="font-size:23px ">Fast Deliver</figcaption>	
        			</figure>
        	    </div>
 				
 			    	<div class="col-lg-4 col-md-4 col-12 mt-4">
        			<figure class="text-center">
        			<img src="imgss/100.jpg" class="img-fluid" width="120" height="120">
        			<figcaption style="font-size:23px ">Natural</figcaption>
        			</figure>
        	    </div>

        	    <div class="col-lg-4 col-md-4 col-12 mt-4">
        			<figure class="text-center">
        			<img src="imgss/best.png" class="img-fluid" width="120" height="120">
        			<figcaption style="font-size:23px ">Best Seller</figcaption>
        			</figure>
        	    </div>      	  
           </div>	
        </div>
    </div>    
</section>





	<%@ include file="footer.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>	
	
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
 <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 4,
        spaceBetween: 20,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
      });
 </script>
</body>
</html>