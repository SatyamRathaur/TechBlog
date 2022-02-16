package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			
			if(con == null) {
				// Loading Driver Class
				Class.forName("com.mysql.jdbc.Driver");
				
				// Creating connection 
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","root");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
}
