package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.Review;

public interface ReviewsDAO {
	public List<Review> selectListreview(int productNo);
}
