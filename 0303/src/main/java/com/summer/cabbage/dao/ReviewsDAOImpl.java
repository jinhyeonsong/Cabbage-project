package com.summer.cabbage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Review;

@Repository
public class ReviewsDAOImpl implements ReviewsDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Review> selectListreview(int productNo) {
		// TODO Auto-generated method stub
		return session.selectList("reviews.selectListreview",productNo);
	}
}
