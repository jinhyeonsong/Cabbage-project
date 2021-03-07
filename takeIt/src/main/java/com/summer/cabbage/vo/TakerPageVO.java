package com.summer.cabbage.vo;

public class TakerPageVO {
private int start,end;
	
	// 필드 추가 ///////////////////////////
	private int takerNo;
	private String status;
	
	// 필드 메서드 추가 ///////////////////


	public int getTakerNo() {
		return takerNo;
	}

	public void setTakerNo(int takerNo) {
		this.takerNo = takerNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	///////////////////////////////////////
	
	
	// 0305 생성자 추가 
	public TakerPageVO(int page,int numPage,int takerNo,String status) {
		this.end=page*numPage;
		this.start=end-numPage+1;
		this.takerNo=takerNo;
		this.status=status;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	public TakerPageVO() {
	}
	
	public TakerPageVO(int page,int numPage) {
		this.end=page*numPage;
		this.start=end-numPage+1;
	}

}
