package com.summer.cabbage.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Subscribe {
	private int no, productNo, takerNo, price, zipCode, giverNo;
	private String takerMsg, addr, addrDetail, delLocation, receiver, addrOpt, phone, productName, id; 
	private char status;
	private Date deliveryStart, cancelDate;
	private Timestamp regdate;
	
	public Subscribe() {
		// TODO Auto-generated constructor stub
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getGiverNo() {
		return giverNo;
	}

	public void setGiverNo(int giverNo) {
		this.giverNo = giverNo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getAddrOpt() {
		return addrOpt;
	}

	public void setAddrOpt(String addrOpt) {
		this.addrOpt = addrOpt;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public String getTakerMsg() {
		return takerMsg;
	}

	public void setTakerMsg(String takerMsg) {
		this.takerMsg = takerMsg;
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

	public String getDelLocation() {
		return delLocation;
	}

	public void setDelLocation(String delLocation) {
		this.delLocation = delLocation;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public Date getDeliveryStart() {
		return deliveryStart;
	}

	public void setDeliveryStart(Date deliveryStart) {
		this.deliveryStart = deliveryStart;
	}

	public Date getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(Date cancelDate) {
		this.cancelDate = cancelDate;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	// 03-03 강필규 추가 핸드폰번호
	public String getPhonenum1() {
		return phone.substring(0,3);
	}
	public String getPhonenum2() {
		return phone.substring(3,7);
	}
	public String getPhonenum3() {
		return phone.substring(7,11);
	}
	
	public String getPhoneTotal() {
		
		return getPhonenum1()+"-"+getPhonenum2()+"-"+getPhonenum3();
		
	}
	// 03 - 03 강필규 추가 end
	
	
}
