package com.summer.cabbage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Subscribe;
import com.summer.cabbage.vo.SubscriptionDay;
import com.summer.cabbage.vo.TakerPageVO;

@Repository
public class SubscribesDAOImpl implements SubscribesDAO {
	@Autowired
	private SqlSession session;

	// 03-04 강필규 추가
	@Override
	public List<Subscribe> selectOrderCheckList(Subscribe subscribe) {
		return session.selectList("subscribes.selectOrderCheckList", subscribe);
	}

	public int selectOrderCheckListCount(Subscribe subscribe) {
		return session.selectOne("subscribes.selectOrderCheckListCount", subscribe);
	}

	@Override
	public int deleteOrderCheckList(int no) {
		return session.update("subscribes.deleteOrderCheckList", no);
	}
	// 03- 04 강필규 추가 end

	// 0304 이성정 시작==========================================================
	// 총 구독자수 얻기
	@Override
	public int selectSubscriberCount(int giverNo) {
		// TODO Auto-generated method stub
		return session.selectOne("subscribes.selectSubscriberCount", giverNo);
	}

	// 오늘의 구독자 수 얻기
	@Override
	public int selectTodaySubscriberCount(int giverNo) {
		// TODO Auto-generated method stub
		return session.selectOne("subscribes.selectTodaySubscriberCount", giverNo);
	}

	// 기버의 구독상품 수 얻기
	@Override
	public int selectNowProductCount(int giverNo) {
		// TODO Auto-generated method stub
		return session.selectOne("subscribes.selectNowProductCount", giverNo);
	}

	// 날짜별 구독수
	@Override
	public List<Map<String, Object>> selectProductCountByDate(int giverNo) {
		// TODO Auto-generated method stub
		return session.selectList("subscribes.selectProductCountByDate", giverNo);
	}
	// ============================================ 0304이성정끝

	// 0305이성정

	@Override
	public int selectItemCount(int takerNo) {
		// TODO Auto-generated method stub
		return session.selectOne("subscribes.selectItemCount", takerNo);
	}

	@Override
	public List<Subscribe> selectSubList(TakerPageVO takerNo) {
		// TODO Auto-generated method stub
		return session.selectList("subscribes.selectSubList", takerNo);
	}

	// 03-04 정진하 추가
	@Override
	public List<Subscribe> selectMonthlySubscriptions(int takerNo) {
		return session.selectList("subscribes.selectMonthlySubscriptions", takerNo);
	}

	@Override
	public List<SubscriptionDay> selectSubscriptionDays(int takerNo) {
		return session.selectList("subscribes.selectSubscriptionDays", takerNo);
	}

	// 0305이성정
	@Override
	public List<Map<String, Object>> selectSubscribersByMonth(int giverNo) {
		// TODO Auto-generated method stub
		return session.selectList("subscribes.selectSubscribersByMonth", giverNo);
	}

}
