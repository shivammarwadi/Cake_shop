<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.cake.shop.dao.PostDao"%>
    <%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cake.shop.entities.post"%>
<%@page import="com.cake.shop.helper.connection"%>
<%@ include file="connn.jsp"%>

<div class="row">
	<%
	PostDao postc = new PostDao(connection.getConnection());
 	int cid = Integer.parseInt(request.getParameter("cid"));
	List<post> post = null;
	if (cid == 0) {
		post = postc.getAllPosts();
	} else {
		post = postc.getPostByCatId(cid);
	}

	if (post.size() == 0) {
		out.println("<h3 class='display-3 text-center'>No posts in this catergory...</h3>");
		return;
	} 
	for (post pp : post) {
		String path ="imgss"+ File.separator; 
	%>

   <div class="col-md-4 mt-2">
 
		<div class="card">
			<a href="singlepage.jsp?pid=<%=pp.getPid()%>"><img class="card-img-top" src="<%=path%><%=pp.getpPic()%>"
				alt="Card image cap" ></a>
			<div class="card-body">
				<b><%=pp.getpTitle()%></b>
				<p>Rs.<%=pp.getpCode()%></p>
				<%-- <a href="singlepage.jsp?pid=<%=pp.getPid()%>" class="btn btn-outline-primary  btn-small">Buy Now..</a>  --%>
			</div>
		</div>
		
	</div>

	<%
	}
	%>
</div>

 
<!-- this is post page.... -->

