package com.summer.cabbage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Product;

@Repository
public class ProductsDAOImpl implements ProductsDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Product> selectByGiverNo(int giverNo) {
		return session.selectList("products.selectByGiverNo",giverNo);
	}
}
