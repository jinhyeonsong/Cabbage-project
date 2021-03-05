package com.summer.cabbage.vo;

import java.sql.Timestamp;

public class TakerAddr {
	private int no, takerNo;
	private String name, addr, addrDetail, phone, zipCode, receiver, type;
	private Timestamp regdate;
	
	public TakerAddr() {
		// TODO Auto-generated constructor stub
	}
	// 작성자 방, 20210303
	 public String getPhoneNum() { 
	 return phone.substring(0,3)+"-"+phone.substring(3,7)+"-"+phone.substring(7, phone.length()); }
	
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
