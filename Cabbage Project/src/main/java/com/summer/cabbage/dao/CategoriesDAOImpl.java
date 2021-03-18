package com.summer.cabbage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Category;

@Repository
public class CategoriesDAOImpl implements CategoriesDAO {
	@Autowired
	private SqlSession session;
	
	// 0312 이소현 수정 / 0304 이소현 _ 2차 카테고리 목록 받아오기
	@Override
	public List<Category> selectSecondCategoryByPriorNo(int priorNo) {
		return session.selectList("categories.selectSecondCategoryByPriorNo", priorNo);
	}
	
	//0313 이소현 _ 카테고리 번호로 1차 카테고리 이름 가져오기
	@Override
	public String selectCategoryEngNameByCategoryNo(int categoryNo) {
		
		return session.selectOne("categories.selectCategoryEngNameByCategoryNo", categoryNo);
	}
	
	//03-05 박형우 추가
	//해당 카테고리의 하위 카테고리 가져오는
	@Override
	public List<Category> selectSecondCategories(int category) {
		return session.selectList("categories.selectSecondCategories", category);
	}
	//210304 박형우
	
	//1차 카테고리 가져오는
	@Override
	public List<Category> selectFirstCategories() {
		return session.selectList("categories.selectFirstCategories");
	}
	//210305 박형우 ---------------------------------------
	//03-05 박형우 추가 end
}
