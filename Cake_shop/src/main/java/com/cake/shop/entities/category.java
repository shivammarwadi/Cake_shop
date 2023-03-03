package com.cake.shop.entities;

public class category 
{
	private int cid;
	private String name;
	private String description;
	
	public category(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}

	public category() {
		super();
	}

	public category(int cid, String name, String description) {
		super();
		this.cid = cid;
		this.name = name;
		this.description = description;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	

}
