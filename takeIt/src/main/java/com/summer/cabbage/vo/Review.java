package com.summer.cabbage.vo;

import java.sql.Timestamp;

public class Review {
	private int no, productNo, takerNo, star, giverNo;
	private String review, productName, takerName, MemberProfileImg, takerNickname;
	private Timestamp regdate;
	private Reply reply;
	public Review() {
		
	}
	
	public int getGiverNo() {
		return giverNo;
	}

	public void setGiverNo(int giverNo) {
		this.giverNo = giverNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getTakerName() {
		return takerName;
	}

	public void setTakerName(String takerName) {
		this.takerName = takerName;
	}

	public String getMemberProfileImg() {
		return MemberProfileImg;
	}

	public void setMemberProfileImg(String memberProfileImg) {
		MemberProfileImg = memberProfileImg;
	}

	public String getTakerNickname() {
		return takerNickname;
	}

	public void setTakerNickname(String takerNickname) {
		this.takerNickname = takerNickname;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
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
