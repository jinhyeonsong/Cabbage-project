package com.summer.cabbage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Giver;
import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.PageVO;
import com.summer.cabbage.vo.Product;

@Repository
public class GiversDAOImpl implements GiversDAO {
	@Autowired
	private SqlSession session;
	

	// 0302 오승주 기버의 상세 ////////////////////////////////
	@Override
	public Giver selectDetail(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("givers.selectDetail",no);
	}
	
	
	
	// 0303 오승주 : 기버의 평균 점수와 리뷰 개수 ///////////////////////
	@Override
	public Giver selectAvgAndCount(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("givers.selectAvgAndCount",no);
	}
	
	
	// 0303 오승주 : 기버의 구독자 수 //////////////////////////////////
	@Override
	public int selectSubCount(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("givers.selectSubCount",no);
	}
	
	
	// 0304 오승주 : 기버의 아이템들 ///////////////////////////////////
	@Override
	public List<Product> selectGiverItems(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("givers.selectGiverItems",pageVO);
	}
	
	// 0304 오승주 : 기버가 가진 아이템 개수 ///////////////////////////
	@Override
	public int selectItemCount(int giverNo) {
		// TODO Auto-generated method stub
		return session.selectOne("givers.selectItemCount",giverNo);
	}
	//////////////////////////////////////////////////////////
	
	//03-04 이아림 추가
	@Override
	public Giver selectGiverInfo(int no) {
		return session.selectOne("givers.selectGiverInfo",no);
	}//selectGiverInfo() end
	
	@Override
	   public int updateProfile(Member member) {
	      return session.update("members.updateProfile", member);
	}
	//03-04 이아림 추가 end
	
	//03-04 송진현 추가
	//기버 사업자번호 받아오기-송진현
		@Override
		public Giver selectbusinessNum(Giver giver) {
			// TODO Auto-generated method stub
			return session.selectOne("givers.selectbusinessNum",giver);
		}
		//기버  회원가입-송진현
		@Override
		public int insertGiver(Giver giver) {
			// TODO Auto-generated method stub
			return session.insert("givers.insertGiver",giver);
		}
		//기버 구독상품번호로 기버 정보받아오기-송진현
		@Override
		public Giver selectDetailOne(int productNo) {
			// TODO Auto-generated method stub
			return session.selectOne("givers.selectDetailOne",productNo);
		}
	//03-04 송진현 추가 end
	
}
