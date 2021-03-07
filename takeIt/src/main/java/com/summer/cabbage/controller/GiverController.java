package com.summer.cabbage.controller;

import java.io.File;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.summer.cabbage.service.GiversService;
import com.summer.cabbage.util.FileRenameUtil;
import com.summer.cabbage.util.ResizeImageUtil;
import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Reply;
import com.summer.cabbage.vo.Review;


@Controller
public class GiverController {

	@Autowired
	private GiversService service;
	
	// 0302 : 오승주 ////////////////////////////////////////// 기버의 상세 정보 
	@RequestMapping(value="/giver/{no}/info",method=RequestMethod.GET)
	public String giverInform(@PathVariable int no,Model model) {
		// 여기다가 기버에 대한 정보랑 기버가 리뷰평점과 구독자 수 나타내기 
		model.addAllAttributes(service.getGiverDetail(no));
		return "giverInform";
	}
	///////////////////////////////////////////////////////////////////////////
	
	
	// 0304 오승주 : 기버의 아이템 출력 
	@RequestMapping(value="/giver/{giverNo}/items",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> giverItems(@PathVariable int giverNo,int page,String sort) {
		// 기버의 아이템을 출력한다. 
		
		return service.getGiverItems(giverNo,page,sort);
	}
	
	//03-03 강필규 추가 주문조회 페이지
	@RequestMapping(value = "/giver/{giverNo}/order/check",method = RequestMethod.GET )
	private String getSubList(@PathVariable int giverNo, Model model, @RequestParam(required = false)String startDate, @RequestParam(required = false)String productNo) {
	
		model.addAllAttributes(service.getGiverOrderCheckList(giverNo, startDate, productNo));
		return "orderCheck";
		
	}
	
	// 03-04 강필규 추가 구독취소
	@RequestMapping(value = "/giver/{giverNo}/order/check",method = RequestMethod.DELETE)
	private String SubDelete(@PathVariable int giverNo,@RequestParam(required = false) int[] no) {
		
		service.deleteOrderCheckList(no);
		
		return "redirect:/giver/"+giverNo+"/order/check";
		
	}
	
	//0304이성정 기버 메인페이지로 이동
	@RequestMapping(value="/giver/{giverNo}/main", method=RequestMethod.GET)
	public String giverMainPage(@PathVariable int giverNo, Model model) {

		Map<String, Object> map =  service.getMainFeature(giverNo);
		model.addAllAttributes(map);
		
		
		return "giverMyPageMain";
	}
	
	//0305이성정 매출관리페이지로 이동
	@RequestMapping(value="/giver/{giverNo}/sales", method=RequestMethod.GET)
	public String giverSalesPage(@PathVariable int giverNo, Model model) {
		
		model.addAllAttributes(service.getSalesFeature(giverNo));
		
		return "salesManagement";
	}
	
	//03-04 이아림 추가
	//기버마이페이지 판매자정보 탭에서 판매자 정보 출력
		@RequestMapping(value="/giver/{no}/info2", method=RequestMethod.GET)
		public String giverInfo(Model model, @PathVariable int no) {
			
			model.addAttribute("giver",service.getGiverInfo(no));
			return "myPageGiver";
		}//giverInfo() end
		
		//기버마이페이지 프로필 수정
		 @RequestMapping(value="/ajax/giver/{no}/profile", method=RequestMethod.POST, produces ="application/json;charset=UTF-8")
	   @ResponseBody
	   public String uploadProfile(String type, MultipartFile profile, HttpServletRequest request, Member member,
	         @PathVariable int no)
	   throws Exception{
	      
	      System.out.println(type);
	      System.out.println(profile);
	      System.out.println(no);
	      
	      //서버
	      ServletContext application = request.getServletContext();
	      //기본경로
	      String rootPath = application.getRealPath("/");
	      //내pc> c드라이브 > bmj> apache-tomcat-8.5.59 > wtpwebapps >ims 임
	      //그래서 그 뒤에 img부터 시작해서 경로 만드는 것임.
	   
	      //업로드 폴더 경로
	      String uploadPath = "img" +File.separator + "upload" + File.separator;
	      
	      //파일의 실제 이름
	      String fileName = profile.getOriginalFilename();
	      File file = new File(uploadPath+fileName);
	      file = FileRenameUtil.rename(file);
	   
	      profile.transferTo(file);
	      //리사이즈가 필요한 경우 하면됨
	      String resizePath = rootPath + "img" +File.separator;
	   
	      //리사이즈
	      ResizeImageUtil.resize(file.toString(), resizePath+file.getName(), 150);
	      member.setProfileImg(file.getName());
	      service.updateProfile(member);
	      
	      return "{\"profileName\":\""+file.getName()+"\"}";
	   }//uploadProfile() end
	// 03- 04 이아림 추가 end

	//ajax salesGraph
	@RequestMapping(value="/ajax/giver/{giverNo}/salesGraph", 
			method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> getSalesGraph(@PathVariable int giverNo){
		System.out.println("ajax sales graph다녀옴");
		
		return service.getSalesChartFeature(giverNo);
	}
	
	//ajax subGraph
	@RequestMapping(value="/ajax/giver/{giverNo}/subGraph", 
			method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> getSubGraph(@PathVariable int giverNo){
		System.out.println("ajax subGraph다녀옴");
		
		
		return service.getSubscribersChartFeature(giverNo);
	}
	//03-04 이소현 추가
	/* 2021-03-02 23:12 이소현 _ 마이페이지 리뷰 관리 _ 기버 번호로 제품 받아오기 */
	@RequestMapping(value = "/giver/{giverNo}/reviewManagement", method = RequestMethod.GET)
	public String reviewManagement(Model model, @PathVariable int giverNo) {

		// System.out.println(giverNo);

		model.addAttribute("products", service.selectProductListByGiverNo(giverNo));
		model.addAttribute("giverNo", giverNo);

		return "giver_mypage_review_management";
	}

	/* 03-03 이소현 _ (productNo로 제품 리뷰 받아오기 _ajax) */

	@RequestMapping(value = "/ajax/reviews", method = RequestMethod.GET)
	@ResponseBody
	public List<Review> getReviews(int productNo, Review review) {

		return service.getReviewList(productNo);

	}

	/* 0304 이소현 _ (기버마이페이지_리뷰관리) 기버가 답글 등록 */
	@RequestMapping(value = "/giver/comment/{giverNo}", method = RequestMethod.POST)
	public String register(Reply reply) {
		
		System.out.println("POST /giver/comment/{giverNo} :"+reply.getGiverNo());
		System.out.println("POST /giver/comment/{giverNo} :"+reply.getReply());
		
		service.registerReply(reply);

		return "redirect:/giver/"+reply.getGiverNo()+"/reviewManagement";
	}
	
	/* 0305 이소현 _ (기버마이페이지_리뷰관리) 기버가 답글 수정 */
	@RequestMapping(value="/giver/comment/{giverNo}", method = RequestMethod.PUT)
	public String modify(Reply reply, @PathVariable int giverNo) {
		
		System.out.println();
		
		System.out.println("답글 수정에서 ");
		System.out.println(reply.getNo());
		System.out.println(reply.getReply());

		service.modifyReply(reply);
		
		return "redirect:/giver/"+giverNo+"/reviewManagement";
	}
	
	/* 0305 이소현 _ (기버마이페이지_리뷰관리) 기버가 답글 삭제 */
	@RequestMapping(value = "/giver/comment/{giverNo}", method = RequestMethod.DELETE)
	public String deleteReply(Reply reply) {
		
		service.removeReply(reply.getNo());
		
		return "redirect:/giver/"+reply.getGiverNo()+"/reviewManagement";
	}
	//03-04 이소현 추가 end

}
