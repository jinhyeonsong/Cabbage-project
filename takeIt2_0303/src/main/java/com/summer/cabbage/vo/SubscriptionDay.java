package com.summer.cabbage.vo;

import java.sql.Date;
import java.util.List;


public class SubscriptionDay {
	
	private Date start;
	private String title;
	private List<Integer> deliveryDays;
	private int productNo;
	
	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public SubscriptionDay() {
		// TODO Auto-generated constructor stub
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Integer> getDeliveryDays() {
		return deliveryDays;
	}

	public void setDeliveryDays(List<Integer> deliveryDays) {
		this.deliveryDays = deliveryDays;
	}
	
	
	

	
	
}
