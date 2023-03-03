package com.cake.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cake.shop.entities.User;
import com.cake.shop.entities.message;
import com.cake.shop.dao.UserDao;

import com.cake.shop.helper.connection;


/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/LoginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try (PrintWriter out = response.getWriter()) {
			String userEmail = request.getParameter("email");
			String password = request.getParameter("pass");

			UserDao dao = new UserDao(connection.getConnection());
			User u = dao.getUserByEmailAndPassword(userEmail, password);

			if (u == null) 
			{				

		        
			} else {
				
				  HttpSession session = request.getSession();
				  session.setAttribute("CurrentUser",u); 		
				  out.println("done"); 
			}		
		}
		doGet(request, response);
	}
}
