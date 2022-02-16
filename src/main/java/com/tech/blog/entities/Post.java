package com.tech.blog.entities;
import java.sql.*;
public class Post {
	private int pId;
	private int cId;
	private String pTitle;
	private String pContent;
	private String pCode;
	private String pPic;
	private Timestamp pDate;
	private int userId;
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Post(int cId, String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int userId) {
		super();
		this.cId = cId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.userId = userId;
	}

	public Post(int pId, int cId, String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int userId) {
		super();
		this.pId = pId;
		this.cId = cId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.userId = userId;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpPic() {
		return pPic;
	}

	public void setpPic(String pPic) {
		this.pPic = pPic;
	}

	public Timestamp getpDate() {
		return pDate;
	}

	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
}
