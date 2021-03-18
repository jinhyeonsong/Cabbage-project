package com.summer.cabbage.vo;

import java.sql.Timestamp;

public class Category {
	private int no, priorNo;
	//0313 이소현 _ 멤버필드 추가(engName)
	private String name, engName;
	private Timestamp regdate;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPriorNo() {
		return priorNo;
	}

	public void setPriorNo(int priorNo) {
		this.priorNo = priorNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	//0313 이소현 _ 추가
	public String getEngName() {
		return engName;
	}
	public void setEngName(String engName) {
		this.engName = engName;
	}
	
}
