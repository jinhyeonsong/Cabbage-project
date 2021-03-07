package com.summer.cabbage.vo;

import java.sql.Timestamp;

public class Payment {
	private int no, cost, cardNo, subNo;
	private Timestamp regdate;
	public Payment() {
		
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
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
