package com.summer.cabbage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.TakerCard;

@Repository
public class TakerCardsDAOImpl implements TakerCardsDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertCardInfo(TakerCard takerCard) {
		return session.insert("takerCards.insertCardInfo", takerCard);
	}
}
