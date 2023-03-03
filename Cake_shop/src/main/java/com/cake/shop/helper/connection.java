package com.cake.shop.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class connection 
{

	private static Connection conn;
	
     public static Connection getConnection()
	{
		try
		{
			if(conn==null)
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
			    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cake_shop","root","");
			}

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return conn;
				
	}
}
