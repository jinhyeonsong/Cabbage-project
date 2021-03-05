package com.summer.cabbage.vo;

import java.util.List;

public class Giver {
	private int no;
	private String businessNum, company, phone,profileImg,id;
	
	// 0303 필드 추가 : 오승주 
	private double reviewAvg;  // 기버의 평균 평점 
	private int reviewCount; // 기버에게 달린 리뷰수, 구독자수
	////////////////////////////////////////////////////////////////
	//03-03 이소현 _ 리뷰 관리 Map으로 가져오려고 시도중.
	private List<Review> productNo;
	
	public Giver() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Review> getProductNo() {
		return productNo;
	}

	public void setProductNo(List<Review> productNo) {
		this.productNo = productNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public double getReviewAvg() {
		return reviewAvg;
	}

	public void setReviewAvg(double reviewAvg) {
		this.reviewAvg = reviewAvg;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getNo() {
		return no;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getBusinessNum() {
		return businessNum;
	}

	public void setBusinessNum(String businessNum) {
		this.businessNum = businessNum;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPhone() {
		return phone.substring(0, 3)+"-"+phone.substring(3, 7)+"-"+phone.substring(7,11);
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
