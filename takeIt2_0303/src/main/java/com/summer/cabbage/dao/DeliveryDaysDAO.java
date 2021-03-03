package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.DeliveryDay;

public interface DeliveryDaysDAO {

	List<DeliveryDay> selectOrderCheckListDays(int productNo);

}
