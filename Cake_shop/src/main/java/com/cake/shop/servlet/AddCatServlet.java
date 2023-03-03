package com.cake.shop.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.cake.shop.dao.PostDao;
import com.cake.shop.entities.category;
import com.cake.shop.entities.post;
import com.cake.shop.helper.connection;
import com.cake.shop.helper.helper;

/**
 * Servlet implementation class AddCatServlet
 */
@WebServlet("/AddCatServlet")
public class AddCatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try(PrintWriter out=response.getWriter())
		{	
		  String name=request.getParameter("cat"); 
		  String description=request.getParameter("dec"); 
		  category c=new category(name, description);
		  PostDao dao=new PostDao(connection.getConnection());
		  
		  
		 if(dao.savecat(c)) 
		     {
			     response.sendRedirect("admin.jsp");
			 }
		else
			  {
			      response.sendRedirect("home.jsp");
		      }
	}

	}
}
