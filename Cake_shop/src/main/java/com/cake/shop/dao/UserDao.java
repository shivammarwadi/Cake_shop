package com.cake.shop.dao;
import java.sql.*;

import com.cake.shop.entities.User;
import com.cake.shop.dao.UserDao;

public class UserDao
{
	private Connection conn;

	public UserDao(Connection conn)
	{
		this.conn=conn;
	}
	
	public boolean saveUser(User user)
	{
		boolean f=false;
		try {
			String query="insert into register(Name,Email,Password,Gender)values(?,?,?,?)";
		    PreparedStatement pst=this.conn.prepareStatement(query);	
		    pst.setString(1,user.getName()); 
		    pst.setString(2,user.getEmail());
		    pst.setString(3,user.getPassword());
		    pst.setString(4,user.getGender());
		    pst.executeUpdate();
			f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	public User getUserByEmailAndPassword(String email,String password)
	{
		User user=null;
		try {
			String query="select * from register where Email=? and Password=?";
			PreparedStatement pst=conn.prepareStatement(query);
			pst.setString(1,email);
			pst.setString(2,password);
			
			pst.executeQuery();
			ResultSet rs=pst.executeQuery();
			
			if(rs.next()) 
			{
			 
				user=new User();
			
				user.setName(rs.getString("Name"));	
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("Email"));
				user.setPassword(rs.getString("Password"));
				user.setGender(rs.getString("Gender"));
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return user;
	}
}
