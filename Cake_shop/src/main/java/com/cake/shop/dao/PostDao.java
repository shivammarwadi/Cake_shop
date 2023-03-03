package com.cake.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.cake.shop.entities.*;
import com.cake.shop.entities.post;



public class PostDao {

	Connection con;
	public PostDao(Connection con) 
	{
		this.con=con;
	}
	
	public ArrayList<category> getAllCategories(){
	  ArrayList<category> list=new  ArrayList<>();	
		try {
		
			String q="select * from categories";
			Statement st=this.con.createStatement();
			ResultSet set=st.executeQuery(q);
			
			while(set.next())
			{
				int cid=set.getInt("cid");
				String name=set.getString("name");
				String description=set.getString("description");
				category c=new category(cid,name,description);
				list.add(c);
			}
		  }
		catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public boolean savePost(post p)
	{
		boolean f=false;
		try {
			String q="insert into post(pTitle,pContent,pCode,pPic,catId)values(?,?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setString(1,p.getpTitle());
			pst.setString(2,p.getpContent());
			pst.setString(3,p.getpCode());
			pst.setString(4,p.getpPic());
			pst.setInt(5,p.getCatId());
			
			
			pst.executeUpdate();
			f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean savecat(category c)
	{
		boolean f=false;
		try {
			String q="insert into categories(name,description)values(?,?)";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setString(1,c.getName());
			pst.setString(2,c.getDescription());
			
			pst.executeUpdate();
			f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	// get all the posts
		public List<post>getAllPosts()
		{
			List<post> list=new ArrayList<>();
			try {
				
				  PreparedStatement p=con.prepareStatement("select * from post order by pid desc"); 
				  ResultSet set=p.executeQuery();

			 while(set.next())
			 {
				 int pid=set.getInt("pid");
				 String pTitle=set.getString("pTitle");
				 String pContent=set.getString("pContent");
				 String pCode=set.getString("pCode");
				 String pPic=set.getString("pPic");				
				 int catId=set.getInt("catId");
				 post post= new post(pid, pTitle, pContent, pCode, pPic, catId);
				 list.add(post);
			 }
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return list;
		}
		public List<post>getPostByCatId(int catId)
		{
			List<post> list=new ArrayList<>();
			try {
				
				 PreparedStatement p=con.prepareStatement("select * from post where catId=?");
				 p.setInt(1, catId);
				 ResultSet set=p.executeQuery();
				 while(set.next())
				 {
					 int pid=set.getInt("pid");
					 String pTitle=set.getString("pTitle");
					 String pContent=set.getString("pContent");
					 String pCode=set.getString("pCode");
					 String pPic=set.getString("pPic");
					 post post= new post(pid, pTitle, pContent, pCode, pPic, catId);
					 list.add(post);
				 }
					
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			return list;
		}
		
		public post getproductById(int i) {
			post p=new post();
			try {
				String q="select * from post where pid=?";
				PreparedStatement pst=con.prepareStatement(q);
				pst.setInt(1, i);
				ResultSet rs=pst.executeQuery();
				while(rs.next()) {
					p.setPid(rs.getInt("pid"));
					p.setpTitle(rs.getString("pTitle"));
					p.setpContent(rs.getString("pContent"));
					p.setpPic(rs.getString("pPic"));
					p.setpCode(rs.getString("pCode"));
					 
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return p;
		}
	
}
