package com.summer.cabbage.vo;

import java.sql.Timestamp;

public class DeliveryRegion {	
	private int no, productNo, areaNo, price;
	private Timestamp regdate;
	//03-04 방현수 추가
	private String primaryRegionName, regionName;
	
	public DeliveryRegion() {
		// TODO Auto-generated constructor stub
	}

	public String getPrimaryRegionName() {
		return primaryRegionName;
	}

	public void setPrimaryRegionName(String primaryRegionName) {
		this.primaryRegionName = primaryRegionName;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
