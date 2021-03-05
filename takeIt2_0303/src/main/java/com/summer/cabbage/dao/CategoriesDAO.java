package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.Category;

public interface CategoriesDAO {

	//0304 이소현 _ 2차 카테고리 목록 불러오기
	public List<Category> selectListByCategory(int priorNo);
	//0304 이소현 _ ?
	public Category selectSecondCategory(int priorNo);
	
}
