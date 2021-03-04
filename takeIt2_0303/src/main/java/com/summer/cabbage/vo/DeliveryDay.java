package com.summer.cabbage.vo;

public class DeliveryDay {
	private int no, productNo, day;
	private String deliveryDay;
	public DeliveryDay() {
		// TODO Auto-generated constructor stub
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

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}
	
	public String getDeliveryDay() {
		
		String[] arr = {"일", "월", "화", "수", "목", "금", "토"};
		
		return arr[day];
		
	}

	public void setDeliveryDay(String deliveryDay) {
		this.deliveryDay = deliveryDay;
	}
	
 	
}
