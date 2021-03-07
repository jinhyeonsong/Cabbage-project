package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.Category;

public interface CategoriesDAO {

	//0304 이소현 _ 2차 카테고리 목록 불러오기
	public List<Category> selectListByCategory(int priorNo);
	//0304 이소현 _ ?
	public Category selectSecondCategory(int priorNo);
	
	//03-05 박형우 추가
	//해당 카테고리의 하위 카테고리 가져오는
	public List<Category> selectSecondCategories(int category);
	//210304 박형우 ---------------------------------------
	//1차 카테고리 가져오는
	public List<Category> selectFirstCategories();
	//210305 박형우 ---------------------------------------
	//03-05 박형우 추가 end
	
}
