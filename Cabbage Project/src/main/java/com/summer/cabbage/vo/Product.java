package com.summer.cabbage.vo;

import java.sql.Timestamp;
import java.util.List;

public class Product {
	private int no, giverNo, categoryNo, price, discount, dateAvail, salesQty, subCount, star, revCount,productNo, takerNo, reviewStar, priorNo, realPrice;
	private String name, photo, reqMsg, details, instruction, type, startDate, review, addrOpt, company, productName, memberProfileImg, takerNickname;
	private Timestamp regdate;
	
	//20210304 카테고리 멤버필드 setter/getter 추가 
	private String primaryCategoryName, categoryName;
	
	// 03-12 방 배송 날짜 추가
	private List<DeliveryDay> days;
	
	public List<DeliveryDay> getDays() {
		return days;
	}

	public void setDays(List<DeliveryDay> days) {
		this.days = days;
	}
	public Product() {
		
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


	public int getReviewStar() {
		return reviewStar;
	}


	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}


	public int getPriorNo() {
		return priorNo;
	}


	public void setPriorNo(int priorNo) {
		this.priorNo = priorNo;
	}


	public int getRealPrice() {
		return realPrice;
	}


	public void setRealPrice(int realPrice) {
		this.realPrice = realPrice;
	}


	public String getReview() {
		return review;
	}


	public void setReview(String review) {
		this.review = review;
	}


	public String getAddrOpt() {
		return addrOpt;
	}


	public void setAddrOpt(String addrOpt) {
		this.addrOpt = addrOpt;
	}


	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getMemberProfileImg() {
		return memberProfileImg;
	}


	public void setMemberProfileImg(String memberProfileImg) {
		this.memberProfileImg = memberProfileImg;
	}


	public String getTakerNickname() {
		return takerNickname;
	}


	public void setTakerNickname(String takerNickname) {
		this.takerNickname = takerNickname;
	}


	public String getPrimaryCategoryName() {
		return primaryCategoryName;
	}

	public void setPrimaryCategoryName(String primaryCategoryName) {
		this.primaryCategoryName = primaryCategoryName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getGiverNo() {
		return giverNo;
	}
	public void setGiverNo(int giverNo) {
		this.giverNo = giverNo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getDateAvail() {
		return dateAvail;
	}
	public void setDateAvail(int dateAvail) {
		this.dateAvail = dateAvail;
	}
	public int getSalesQty() {
		return salesQty;
	}
	public void setSalesQty(int salesQty) {
		this.salesQty = salesQty;
	}
	public int getSubCount() {
		return subCount;
	}
	public void setSubCount(int subCount) {
		this.subCount = subCount;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getRevCount() {
		return revCount;
	}
	public void setRevCount(int revCount) {
		this.revCount = revCount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getReqMsg() {
		return reqMsg;
	}
	public void setReqMsg(String reqMsg) {
		this.reqMsg = reqMsg;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getInstruction() {
		return instruction;
	}
	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	
	
}
