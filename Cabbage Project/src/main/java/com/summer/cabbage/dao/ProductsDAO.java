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
	// 03-03 이소현 _ 기버번호로 제품 정보 받아오기
	public List<Product> selectProductListByGiverNo(int giverNo);

	// 03-04 이소현 _ 카테고리 번호로 제품 목록 받아오기
	public List<Product> selectProductListByCategory(PageVO pageVO);

	//0313 수정 / 0304 이소현 _ 상품 전체 크기를 얻어오기
	public int selectTotal(int categoryNo);
	
	//0314 이소현 _ (검색 결과) 검색 결과 총 갯수
	public int selectTotalProductListByKeyword(String keyword);
	
	//0314 이소현 _ (검색 결과) 상품 검색 결과 목록 받아오기
	public List<Product> selectSearchResultBykeyword(PageVO pageVO);

	
	//구독 등록하기 210304 박형우
	public int insertProduct(Product product);
	//상품 가져오기
	public Product selectNo(int no);
	//최신 상품 가져오기
	public List<Product> selectRecentProducts();
	//List에 보여줄 정보 가져오기
	public Product selectProductCard(int no);
	//210306 박형우 end
	
	//03-12 방 상품 목록 ajax
	public List<Product> selectTotalListByGiverNo(Product product);

	// 03-12 방 타입별 상품 목록 개수

	public int selectItemNumbersTotal(int giverNo);
	
	public int selectItemNumbersOnSale(int giverNo);

	public int selectItemNumbersOnHold(int giverNo);

	public int selectItemNumbersEnded(int giverNo);


}
