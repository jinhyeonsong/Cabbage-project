package com.summer.cabbage.vo;

import java.sql.Timestamp;

public class TakerCard {
	private int no, takerNo;
	private String cardNum, cvc;
	private Timestamp regdate;
	public TakerCard() {
		
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getTakerNo() {
		return takerNo;
	}
	public void setTakerNo(int takerNo) {
		this.takerNo = takerNo;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getCvc() {
		return cvc;
	}
	public void setCvc(String cvc) {
		this.cvc = cvc;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
