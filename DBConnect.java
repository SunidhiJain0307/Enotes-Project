package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	static Connection con;
	public static Connection dbConnect()
	{

		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url="jdbc:mysql://localhost:3306/enotes";
			con=DriverManager.getConnection(url,"root","mysql");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return con;

	}

}
