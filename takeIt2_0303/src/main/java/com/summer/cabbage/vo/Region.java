package com.summer.cabbage.vo;

public class Region {
	private int no, priorNo;
	private String name;
	//03-04 방현수 추가
	private String primaryRegionName;
	
	public Region() {
		// TODO Auto-generated constructor stub
	}
	
	public String getPrimaryRegionName() {
		return primaryRegionName;
	}
	public void setPrimaryRegionName(String primaryRegionName) {
		this.primaryRegionName = primaryRegionName;
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
	
	
}
