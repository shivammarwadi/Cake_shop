package com.cake.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cake.shop.dao.UserDao;
import com.cake.shop.entities.User;
import com.cake.shop.helper.connection;

@WebServlet("/RegisterServlet1")
public class RegisterServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out=response.getWriter())
		{
			
			String check=request.getParameter("user_check");
			if(check==null)
			{
				out.println("please check tearm and condition..");
			}
			else
			{
				String name=request.getParameter("user_name");
				String email=request.getParameter("user_email");
				String password=request.getParameter("user_password");
				String gender=request.getParameter("gender");
				
				User user=new User(name,email,password,gender);
				
				UserDao dao=new UserDao(connection.getConnection());
				
				if(dao.saveUser(user))
				{
					out.println("done");
				}
				else
				{
					out.println("Error");
				}

			}		
		}
		
	}
}

