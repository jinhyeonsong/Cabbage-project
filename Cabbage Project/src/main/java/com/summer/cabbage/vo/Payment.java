package com.summer.cabbage.vo;

import java.sql.Timestamp;

public class Payment {
	private int no, price, cardNo, subNo;
	private Timestamp regdate;
	
	// 03-12 방 cost -> price로 변경
	public Payment() {
		
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}
	public int getSubNo() {
		return subNo;
	}
	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
