package com.tech.blog.dao;
import java.sql.*;
public class LikeDao {
	Connection con;

	public LikeDao(Connection con) {
		super();
		this.con = con;
	}
	
	// Insert like on a post 
    public boolean insertLike(int pId,int uId) {
    	boolean f = false;
    	try {
    		
    		String q = "insert into liked(pid,uid) values(?,?)";
    		PreparedStatement p = this.con.prepareStatement(q);
    		p.setInt(1, pId);
    		p.setInt(2, uId);
    		p.executeUpdate();
    		f = true;
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return f;
    }
    
    // count likes on a post
    public int countLikesByPostId(int pId) {
    	int count = 0;
    	try {
    		
    		String q = "select count(*) from liked where pid=?";
    		PreparedStatement p = this.con.prepareStatement(q);
    		p.setInt(1,pId);
    		ResultSet set = p.executeQuery();
    		if(set.next()) {
    			count = set.getInt("count(*)");
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	
    	return count;
    }
    
    public boolean isLikeByUser(int pId,int uId) {
    	boolean f = false;
    	
    	try {
    		
    		PreparedStatement p = this.con.prepareStatement("select * from liked where pid=? and uid=?");
    		p.setInt(1, pId);
    		p.setInt(2, uId);
    		ResultSet set = p.executeQuery();
    		if(set.next()) {
    			f = true;
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return f;
    }
    
    public boolean dislike(int pId,int uId) {
    	boolean f = false;
    	
    	try {
    		
    		PreparedStatement p = this.con.prepareStatement("delete from liked where pid=? and uid=?");
    		p.setInt(1, pId);
    		p.setInt(2, uId);
    		p.executeQuery();
    		f = true;
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return f;
    }
}
