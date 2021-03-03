package com.summer.cabbage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeliveryDaysDAOImpl implements DeliveryDaysDAO {
	@Autowired
	private SqlSession session;
}
