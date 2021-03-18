package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.Category;

public interface CategoriesDAO {

	//0312 이소현 수정 /  0304 이소현 _ 2차 카테고리 목록 불러오기
	public List<Category> selectSecondCategoryByPriorNo(int priorNo);
	
	//0313 이소현 _ 카테고리 번호로 1차 카테고리 이름 가져오기
	public String selectCategoryEngNameByCategoryNo(int categoryNo);

	
	//03-05 박형우 추가
	//해당 카테고리의 하위 카테고리 가져오는
	public List<Category> selectSecondCategories(int category);
	//210304 박형우 ---------------------------------------
	//1차 카테고리 가져오는
	public List<Category> selectFirstCategories();
	//210305 박형우 ---------------------------------------
	//03-05 박형우 추가 end
	
}
