package com.summer.cabbage.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.summer.cabbage.dao.CategoriesDAO;
import com.summer.cabbage.dao.GiversDAO;
import com.summer.cabbage.dao.MembersDAO;
import com.summer.cabbage.dao.PaymentsDAO;
import com.summer.cabbage.dao.ProductsDAO;
import com.summer.cabbage.dao.TakersDAO;
import com.summer.cabbage.util.SendEmailUtil;
import com.summer.cabbage.vo.Giver;
import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Product;
import com.summer.cabbage.vo.Taker;

@Service
public class MembersServiceImpl implements MembersService {

	@Autowired
	private MembersDAO membersDAO;
	
	@Autowired
	private TakersDAO takersDAO;
	
	//03-04 송진현추가
	@Autowired
	private GiversDAO giversDAO;
	//03-05 박형우 추가
	@Autowired
	private CategoriesDAO categoriesDAO;
	@Autowired
	private PaymentsDAO paymentsDAO;
	@Autowired
	private ProductsDAO productDAO;
	
	@Override
	public Member login(Member member) {
		// TODO Auto-generated method stub
		return membersDAO.selectLogin(member);
	}
	@Override
	public void findPw(Member member) {
		
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 10; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			//랜덤 비밀번호 set
			member.setPassword(pw);
			
			//member dao에 update 구문
			membersDAO.updatePw(member);

			// 비밀번호 변경 메일 발송
			SendEmailUtil.sendEmail(member, "findpw");
		
	}
	//03-04 이아림 추가 
	@Override
	public boolean checkNickname(String nickname) {
		return 1==membersDAO.selectNickname(nickname);
	}
	
	@Override
	public boolean checkId(String id) {
		return 1==membersDAO.selectCheckId(id);
	}
	//03-04 이아림 추가 end 
	
	//03-04 송진현 추가
	@Override
	public Giver getGiverBusinessNum(Giver giver) {
		return giversDAO.selectbusinessNum(giver);
	}
	
	@Override
	public boolean checkBusinessName(String businessName) {
		return 1==membersDAO.selectBusinessName(businessName);
	}
	@Override
	public boolean checkGiverId(String id) {
		return 1==membersDAO.selectId(id);
	}
	
	@Override
	public void singUpGiver(Member member, Giver giver) {
		 membersDAO.insertMember(member);
		 	
		 giver.setNo(member.getNo());
		
		 giversDAO.insertGiver(giver);
	}
	//03-04 송진현 추가 end
	
	//메인 폼 서비스 03-05 박형우 추가
	@Override
	public Map<String, Object> showMainForm() {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("categories", categoriesDAO.selectFirstCategories());
		
		List<Integer> listC = paymentsDAO.selectThisWeekProductNoC();
		List<Integer> listF = paymentsDAO.selectThisWeekProductNoF();
		List<Integer> listH = paymentsDAO.selectThisWeekProductNoH();
		
		List<Product> hotCProducts = new ArrayList<Product>();
		List<Product> hotFProducts = new ArrayList<Product>();
		List<Product> hotHProducts = new ArrayList<Product>();
		for(int i=0; i<5; i++) {
			if(listC.size()>i) {
				hotCProducts.add(productDAO.selectProductCard(listC.get(i)));
			}
			if(listF.size()>i) {
				hotFProducts.add(productDAO.selectProductCard(listF.get(i)));
			}
			if(listH.size()>i) {
				hotHProducts.add(productDAO.selectProductCard(listH.get(i)));
			}
		}
		
		map.put("hotCProducts", hotCProducts);
		map.put("hotFProducts", hotFProducts);
		map.put("hotHProducts", hotHProducts);
		
		List<Product> currentProducts = productDAO.selectRecentProducts();
		map.put("currentProducts", currentProducts);
		
		return map;
	}
	
	//03-16 이아림 수정
	@Override
	@Transactional //member에 insert 오류 시 taker에도 insert되지 않도로 함
	public void signUpTaker(Member member, Taker taker) {
		//생년월일 형변환
		String birthDateStr = taker.getBirthYear()+"-"+taker.getBirthMonth()+"-"+taker.getBirthDay();
		
		Date birthDate = Date.valueOf(birthDateStr);
		
		taker.setBirthDate(birthDate);
		
		System.out.println(birthDate);
		
		membersDAO.insertTaker(member);
		//멤버의 no를 받아와서 taker의 no로 입력
		taker.setNo(member.getNo());
		System.out.println(taker.getNo());
		takersDAO.insertTaker(taker);
		
	}//signUpTaker() end
	//03-16 이아림 수정 end
	
	// 03-16 방 기버 정보 받아오기
	@Override
	public Giver getGiverInfo(int no) {
		return giversDAO.selectGiverInfo(no);
	}
	
} 

