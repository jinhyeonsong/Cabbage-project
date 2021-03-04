package com.summer.cabbage.dao;

import com.summer.cabbage.vo.Giver;
import com.summer.cabbage.vo.Product;

public interface GiversDAO {

	Giver selectDetail(int no);
	Giver selectbusinessNum(Giver giver);
	public int insertGiver(Giver giver);
	public Giver selectDetailOne(int productNo);
}
