package com.summer.cabbage.vo;

public class PageVO {

	private int start,end;
	
	// 필드 추가 ///////////////////////////
	private int giverNo;
	//0312 이소현 멤버필드 categoryName, keyword, category 추가
	private String sort, categoryName, keyword, category;
	//0304 이소현 멤버필드 추가
	private int  memberNo, priorNo, categoryNo;
	
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getPriorNo() {
		return priorNo;
	}

	public void setPriorNo(int priorNo) {
		this.priorNo = priorNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	// 필드 메서드 추가 ///////////////////
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getGiverNo() {
		return giverNo;
	}

	public void setGiverNo(int giverNo) {
		this.giverNo = giverNo;
	}
	

	///////////////////////////////////////
	
	
	

	public PageVO() {
	}
	
	public PageVO(int page,int numPage) {
		this.end=page*numPage;
		this.start=end-numPage+1;
	}

	
	// 생성자 추가 ////////////////////////////////////////////
	public PageVO(int page,int numPage,int giverNo) {
		this.end=page*numPage;
		this.start=end-numPage+1;
		this.giverNo=giverNo;
	}
	
	public PageVO(int page,int numPage,int giverNo,String sort) {
		this.end=page*numPage;
		this.start=end-numPage+1;
		this.giverNo=giverNo;
		this.sort=sort;
	}
	
	//0314 이소현 추가
	public PageVO(int page,int numPage, String keyword, String sort, String category) {
		this.end=page*numPage;
		this.start=end-numPage+1;
		this.keyword=keyword;
		this.sort=sort;
		this.category=category;
	}
	/////////////////////////////////////////////////////////////
	

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	//0312 이소현 _ 추가
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
}
