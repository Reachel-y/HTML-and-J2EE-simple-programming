package com.entities;

public class model_user {
	private String username;
	private int pass;
	//username
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	//password
	public int getPass() {
		return pass;
	}
	public void setPass(int pass) {
		this.pass=pass;
	}
	
	public model_user(String username,int password) {
		this.username = username;
		this.pass = password;
	}
}
