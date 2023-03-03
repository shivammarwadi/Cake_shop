<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
 			Class.forName("com.mysql.cj.jdbc.Driver");
 			java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cake_shop","root","");
    %>
</body>
</html>