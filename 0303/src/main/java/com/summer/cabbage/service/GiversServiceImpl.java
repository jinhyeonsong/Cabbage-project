package com.summer.cabbage.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.cabbage.dao.GiversDAO;
import com.summer.cabbage.vo.Giver;

@Service
public class GiversServiceImpl implements GiversService {

	@Autowired
	private GiversDAO giversDAO;
	
	// 0302 판매자 정보 더보기 : 오승주 ===============================
	@Override
	public Map<String, Object> getGiverDetail(int no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map=new ConcurrentHashMap<String, Object>();
		
		map.put("giver", giversDAO.selectDetail(no));
		//map.put("riviewAvg",null);
		
		
		return map;
	}
	// =================================================================
	
}
