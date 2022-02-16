package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;

public class UserDao {
	private Connection con;
	private boolean f = false;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		try {
			
			String q = "insert into user(name,email,password,gender,about) value(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(q);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			
			pstmt.executeUpdate();
			f = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	// get user by email and password
	
	public User getUserByEmailAndPassword(String email,String password) {
		User user = null;
		try {
			
			String q = "select * from user where email=? and password=?";
			PreparedStatement pstmt = this.con.prepareStatement(q);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	// Update data method
	
	public boolean update(User user) {
		boolean f = false;
		
		try {
			
			String q = "update user set name=?, email=?, password=?, about=?, profile=? where id=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getAbout());
			pstmt.setString(5, user.getProfile());
			pstmt.setInt(6, user.getId());
			
			pstmt.executeUpdate();
			f = true;
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	//Get user by userId
	
	public User getUserByUserId(int userId) {
		User user = null;
		try {
			String q ="select * from user where Id=?";
			PreparedStatement p = this.con.prepareStatement(q);
			p.setInt(1, userId);
			ResultSet set = p.executeQuery();
			
			if(set.next()) {
				
				user = new User();
				user.setId(set.getInt("id"));
				user.setName(set.getString("name"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
}
