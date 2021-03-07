package com.summer.cabbage.vo;

import java.sql.Date;

public class Taker {
	private int no,totalPrice;
	private String name, nickname, gender;
	private Date birthDate;

	
	public Taker() {
		
	}
	
	
	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	
}
