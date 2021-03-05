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
	
	//0304 이소현 _ 2차 카테고리 목록 받아오기
	@Override
	public List<Category> selectListByCategory(int priorNo) {
		return session.selectList("categories.selectListByCategory",priorNo);
	}
	
	//0304 이소현 ??
	@Override
	public Category selectSecondCategory(int priorNo) {
		
		return session.selectOne("categories.selectSecondCategory",priorNo);
	}
}
