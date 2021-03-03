package com.summer.cabbage.dao;

import com.summer.cabbage.vo.Giver;

public interface GiversDAO {

	Giver selectDetail(int no);
	Giver selectbusinessNum(Giver giver);
}
