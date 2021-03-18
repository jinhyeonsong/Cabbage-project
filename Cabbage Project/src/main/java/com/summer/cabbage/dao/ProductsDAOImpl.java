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
	
	// 03-03 이소현 _ (목록페이지) 카테고리 번호로 제품 목록 불러오기
	@Override
	public List<Product> selectProductListByCategory(PageVO pageVO) {

		return session.selectList("products.selectProductListByCategory", pageVO);
	}

	//0313 수정 / 0304 이소현 _ 상품 전체 크기를 얻어오기
	@Override
	public int selectTotal(int categoryNo) {

		return session.selectOne("products.selectTotal", categoryNo);
	}
	
	//0314 이소현 _ (검색 결과) 검색 결과 총 갯수 받아오기
	@Override
	public int selectTotalProductListByKeyword(String keyword) {
		
		return session.selectOne("products.selectTotalProductListByKeyword", keyword);
	}
	
	//0314 이소현 _ (검색 결과) 검색 결과 목록 받아오기
	@Override
	public List<Product> selectSearchResultBykeyword(PageVO pageVO) {
		System.out.println("DAO에서 검색 결과"+pageVO.getKeyword());
		return session.selectList("products.selectSearchResultBykeyword", pageVO);
	}
	
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
	
	// 03-12 방 상품 목록 ajax
	@Override
	public List<Product> selectTotalListByGiverNo(Product product) {
		return session.selectList("products.selectTotalListByGiverNo",product);
	}
	
	// 03-12 방 타입별 상품 목록 개수

	@Override
	public int selectItemNumbersTotal(int giverNo) {
		return session.selectOne("products.selectItemNumbersTotal", giverNo);
	}
	
	@Override
	public int selectItemNumbersOnSale(int giverNo) {
		return session.selectOne("products.selectItemNumbersOnSale", giverNo);
	}
	
	@Override
	public int selectItemNumbersOnHold(int giverNo) {
		return session.selectOne("products.selectItemNumbersOnHold", giverNo);
	}
	
	@Override
	public int selectItemNumbersEnded(int giverNo) {
		return session.selectOne("products.selectItemNumbersEnded", giverNo);
	}
	
}
