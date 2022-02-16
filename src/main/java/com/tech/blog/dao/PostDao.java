package com.tech.blog.dao;

import java.sql.*;
import java.util.ArrayList;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();

		try {

			String q = "select * from categories";
			Statement s = this.con.createStatement();
			ResultSet set = s.executeQuery(q);
			while (set.next()) {
				int cId = set.getInt("cId");
				String cName = set.getString("cName");
				String cDescription = set.getString("cDescription");
				Category c = new Category(cId, cName, cDescription);
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean savePost(Post post) {
		boolean f = false;
		try {

			String q = "insert into posts(cId,pTitle,pContent,pCode,pPic,userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(q);
			pstmt.setInt(1, post.getcId());
			pstmt.setString(2, post.getpTitle());
			pstmt.setString(3, post.getpContent());
			pstmt.setString(4, post.getpCode());
			pstmt.setString(5, post.getpPic());
			pstmt.setInt(6, post.getUserId());

			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// Get all post
	public ArrayList<Post> getAllPost() {
		ArrayList<Post> list = new ArrayList<>();

		try {

			Statement s = this.con.createStatement();
			ResultSet set = s.executeQuery("select * from posts order by pId desc");
			while (set.next()) {
				int pId = set.getInt("pId");
				int cId = set.getInt("cId");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int userId = set.getInt("userId");

				Post p = new Post(pId, cId, pTitle, pContent, pCode, pPic, pDate, userId);
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// Get all post of same Category id
	public ArrayList<Post> getAllPostByCategoryId(int cId) {
		ArrayList<Post> list = new ArrayList<>();

		try {

			String q = "select * from posts where cId=?";
			PreparedStatement pstmt = this.con.prepareStatement(q);
			pstmt.setInt(1, cId);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				int pId = set.getInt("pId");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int userId = set.getInt("userId");

				Post p = new Post(pId, cId, pTitle, pContent, pCode, pPic, pDate, userId);
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	// Get Post by postId 
	public Post getPostByPostId(int postId) {
		Post post = null;
		try {
			
			String q = "select * from posts where pId=?";
			PreparedStatement p = this.con.prepareStatement(q);
			p.setInt(1, postId);
			ResultSet set = p.executeQuery();
			
			if(set.next()) {
				
				int pId = set.getInt("pId");
				int cId = set.getInt("cId");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int userId = set.getInt("userId");

				post = new Post(pId, cId, pTitle, pContent, pCode, pPic, pDate, userId);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return post;
	}
	

}
