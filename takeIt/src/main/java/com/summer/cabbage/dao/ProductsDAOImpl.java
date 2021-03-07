package com.summer.cabbage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.cabbage.vo.PageVO;
import com.summer.cabbage.vo.Product;

@Repository
public class ProductsDAOImpl implements ProductsDAO {
	@Autowired
	private SqlSession session;
	
	//03-04 강필규 추가
	@Override
	public List<Product> selectByGiverNo(int giverNo) {
		return session.selectList("products.selectByGiverNo",giverNo);
	}
	//03-05 오승주 추가
	@Override
	public int selectGiverItemNum(int no) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 03-04 방현수 추가 구독 상품 정보 얻어오기 
	@Override
	public Product selectOne(int productNo) {
		return session.selectOne("products.selectProduct", productNo);
	}
	
	//03-04 송진현 추가
	@Override
	public Product selectDetailOne(int productNo) {
		return session.selectOne("products.selectDetailOne",productNo);
	}
	//03-04 이소현 추가
	// 03-03 이소현_ (기버마이페이지_리뷰관리) 기버번호로 제품 리스트 불러오기
	@Override
	public List<Product> selectProductListByGiverNo(int giverNo) {
		
		return session.selectList("products.selectProductListByGiverNo",giverNo);
	}
	
	//03-03 이소현 _ (목록페이지) 카테고리 번호로 제품 목록 불러오기
	@Override
	public List<Product> selectProductListByCategory(PageVO pageVO) {
		System.out.println("여기?22");
		return session.selectList("products.selectProductListByCategory",pageVO);
	}
	
	//0304 이소현 _ 상품 전체 크기를 얻어오기
	@Override
	public int selectTotal() {
		
		return session.selectOne("products.selectTotal");
	}
	//03-04 이소현 추가 end
	
	//구독 등록하기 03-06 박형우
	@Override
	public int insertProduct(Product product) {
		return session.insert("products.insertProduct", product);
	}
	
	//상품 가져오기
	@Override
	public Product selectNo(int no) {
		return session.selectOne("products.selectNo", no);
	}
	
	//최신 상품 가져오기
	@Override
	public List<Product> selectRecentProducts() {
		return session.selectList("products.selectRecentProducts");
	}
 
	@Override
	public Product selectProductCard(int no) {
		return session.selectOne("selectProductCard", no);
	}
	//구독 등록하기 03-06 박형우 end
	
}
