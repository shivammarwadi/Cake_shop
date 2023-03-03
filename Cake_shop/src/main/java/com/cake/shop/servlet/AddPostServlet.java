package com.cake.shop.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.cake.shop.dao.PostDao;
import com.cake.shop.entities.User;
import com.cake.shop.entities.post;
import com.cake.shop.helper.connection;
import com.cake.shop.helper.helper;


/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
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
		
		
		  int cid=Integer.parseInt(request.getParameter("cid")); 
		  String pContent=request.getParameter("pContent"); 
		  String pTitle=request.getParameter("pTitle"); 
		  String pCode=request.getParameter("pCode");
		  Part part=request.getPart("pic");
		
		  post p=new post(pTitle, pContent, pCode,part.getSubmittedFileName(), cid);
		  PostDao dao=new PostDao(connection.getConnection());
		 if(dao.savePost(p)) 
		     {
			    String path=request.getRealPath("/")+"imgss"+File.separator+part.getSubmittedFileName();
				helper.saveImage(part.getInputStream(), path);
				out.println("done");
		     }
		    else {
					  System.out.println("data not saved");  
				  }
			  }
	
			
	}
	 
}
