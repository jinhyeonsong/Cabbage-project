package com.summer.cabbage.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.cabbage.dao.DeliveryDaysDAO;
import com.summer.cabbage.dao.SubscribesDAO;
import com.summer.cabbage.dao.TakersDAO;
import com.summer.cabbage.util.PaginateUtil;
import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Subscribe;
import com.summer.cabbage.vo.Taker;
import com.summer.cabbage.vo.TakerPageVO;

@Service
public class TakersServiceImpl implements TakersService {
	
	@Autowired
	private SubscribesDAO subscribesDAO;
	@Autowired
	private DeliveryDaysDAO deliveryDaysDAO;
	//03-04 정진하 추가
	@Autowired
	private TakersDAO takersDAO;

public Map<String, Object> getSubList(int takerNo, String status, int page){
		
		Map<String,Object> map=new ConcurrentHashMap<String, Object>();
		
		TakerPageVO pageVO=new TakerPageVO(page,3,takerNo,status);
		
		int total=subscribesDAO.selectItemCount(takerNo);
		
		String paginate=PaginateUtil.getPaginate(page, total, 3, 3,"/taker/"+takerNo+"/items");
		
		List<Subscribe> list=subscribesDAO.selectSubList(pageVO);
//		
		for (Subscribe subscribe : list) {
		// 여기다가 배송가능 요일 해주고 
			subscribe.setDeliveryDays(deliveryDaysDAO.selectListByproductNo(subscribe.getProductNo()));
		// 여기다가는 다음 결제일 해주기 
		}
		
		map.put("itemList", list);
		map.put("paginate", paginate);

		return map;
	}
	//03-04 정진하 추가
	@Override
	public Taker getTaker(int no) {
		return takersDAO.selectOneByNo(no);
	}
	
	@Override
	public boolean updateProfile(Member member) {
		return 1==takersDAO.updateProfile(member);
	}
	
	@Override
	public boolean checkNickname(String nickname) {
		return 1==takersDAO.selectCheckNickname(nickname);
	}
	
	@Override
	public boolean updateNickname(Taker taker) {
		return 1==takersDAO.updateNickname(taker);
	}
	//03-04 정진하 end
	
	
}
