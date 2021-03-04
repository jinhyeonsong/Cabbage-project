package com.summer.cabbage.vo;

import java.sql.Timestamp;

public class Review {
	private int no, productNo, takerNo, star;
	private String review;
	private Timestamp regdate;
	public Review() {
		
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
	public int getTakerNo() {
		return takerNo;
	}
	public void setTakerNo(int takerNo) {
		this.takerNo = takerNo;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
