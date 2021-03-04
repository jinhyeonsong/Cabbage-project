package com.summer.cabbage.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.cabbage.dao.DeliveryDaysDAO;
import com.summer.cabbage.dao.DeliveryRegionsDAO;
import com.summer.cabbage.dao.GiversDAO;
import com.summer.cabbage.dao.ProductsDAO;
import com.summer.cabbage.dao.ReviewsDAO;

@Service
public class SubscribesServiceImpl implements SubscribesService {

	@Autowired
	private ProductsDAO productsDAO;
	@Autowired
	private GiversDAO giversDAO;
	@Autowired
	private DeliveryDaysDAO deliveryDaysDAO;
	@Autowired
	private DeliveryRegionsDAO deliveryRegionsDAO;
	@Autowired
	private ReviewsDAO reviewsDAO;
	
	@Override
	public Map<String, Object> getProductDetail(int productNo) {
		Map<String, Object> map= new ConcurrentHashMap<String, Object>();
		
		map.put("product",productsDAO.selectDetailOne(productNo));
		map.put("giver",giversDAO.selectDetailOne(productNo));
		map.put("deliveryDays",deliveryDaysDAO.selectListDay(productNo));
		map.put("deliveryRegions",deliveryRegionsDAO.selectListRegion(productNo));
		map.put("reviews",reviewsDAO.selectListreview(productNo));
		
		return map;
	}
}
