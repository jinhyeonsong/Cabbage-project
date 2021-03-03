package com.summer.cabbage.service;

import java.util.List;
import java.util.Map;

import com.summer.cabbage.vo.Subscribe;

public interface GiversService {

	Map<String,Object> getGiverDetail(int no);

	public Map<String,Object> getGiverOrderCheckList(int giverNo);


}
