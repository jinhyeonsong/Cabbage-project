package com.summer.cabbage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Product;

@Repository
public class ProductsDAOImpl implements ProductsDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public Product selectDetailOne(int productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("products.selectDetailOne",productNo);
	}
}
