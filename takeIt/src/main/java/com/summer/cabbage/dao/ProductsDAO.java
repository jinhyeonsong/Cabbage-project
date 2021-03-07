package com.summer.cabbage.dao;

import java.util.List;

import com.summer.cabbage.vo.PageVO;
import com.summer.cabbage.vo.Product;

public interface ProductsDAO {

	//03-04 강필규 추가
	List<Product> selectByGiverNo(int giverNo);
	
	//03-04 오승주 추가
	int selectGiverItemNum(int no);
	
	// 20210304 방 구독 상품 정보 얻어오기
	public Product selectOne(int subsNo);
	
	// 03-04 송진현 추가
	public Product selectDetailOne(int productNo);
	
	//03-04 이소현 추가
	//03-03 이소현 _ 기버번호로 제품 정보 받아오기
	public List<Product> selectProductListByGiverNo(int giverNo); 
	
	//03-04 이소현 _ 카테고리 번호로 제품 목록 받아오기
	public List<Product> selectProductListByCategory(PageVO pageVO);
	
	//0304 이소현 _ 상품 전체 크기를 얻어오기
	public int selectTotal();
	//03-04 이소현 추가 end
	
	//구독 등록하기 210304 박형우
	public int insertProduct(Product product);
	//상품 가져오기
	public Product selectNo(int no);
	//최신 상품 가져오기
	public List<Product> selectRecentProducts();
	//List에 보여줄 정보 가져오기
	public Product selectProductCard(int no);
	//210306 박형우 end


}
