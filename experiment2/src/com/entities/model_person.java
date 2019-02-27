package com.entities;

public class model_person {
	private String username;
	private String name;
	private int age;
	private String telenum;
	//username
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	//name
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	//age
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age=age;
	}
	//telenum
	public String getTelenum() {
		return telenum;
	}
	public void setTelenum(String telenum) {
		this.telenum = telenum;
	}
	
	public model_person (String username,String name,int age,String telenum) {
		this.username = username;
		this.name = name;
		this.age = age;
		this.telenum = telenum;
	}
}
