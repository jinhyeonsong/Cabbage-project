package com.summer.cabbage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.Reply;

@Repository
public class RepliesDAOImpl implements RepliesDAO {
	@Autowired
	private SqlSession session;
	//0304 이소현 추가
	//0304 이소현 _ (리뷰관리) 답글 받아오기
	@Override
	public Reply selectOneReply(int no) {
		
		return session.selectOne("replies.selectOneReply",no);
	}
	
	//0304 이소현 _ (리뷰관리) 답글 등록
	@Override
	public int insertReply(Reply reply) {
		
		return session.insert("replies.insertReply",reply);
	}
	
	//0305 이소현 _ (리뷰관리) 답글 수정
	@Override
	public int updateReply(Reply reply) {
		
		return session.update("replies.updateReply", reply);
	}
	
	//0305 이소현 _ (리뷰관리) 답글 삭제
	@Override
	public int deleteReply(int no) {
		
		return session.delete("replies.deleteReply", no);
	}
	//0304 이소현 추가 end
}
