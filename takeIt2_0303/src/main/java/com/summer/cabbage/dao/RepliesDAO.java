package com.summer.cabbage.dao;

import com.summer.cabbage.vo.Reply;

public interface RepliesDAO {

	//03-04 이소현 추가
	//0304 이소현 _(리뷰관리) 답글 받아오기
	public Reply selectOneReply(int no);
	
	//0304 이소현 _ (리뷰관리) 답글 등록하기
	public int insertReply(Reply reply);
	
	//0305 이소현 _ (리뷰관리) 답글 수정하기
	public int updateReply(Reply reply);
	
	//0305 이소현 _ (리뷰관리) 답글 삭제하기
	public int deleteReply(int no);
	//03-04 이소현 추가 end
	
	
}
