package com.summer.cabbage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.summer.cabbage.service.SubscribesService;
import com.summer.cabbage.util.FileRenameUtil;
import com.summer.cabbage.util.ResizeImageUtil;
import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Product;
import com.summer.cabbage.vo.Region;
import com.summer.cabbage.vo.Subscribe;
import com.summer.cabbage.vo.SubscriptionDay;
import com.summer.cabbage.vo.TakerAddr;

@Controller
public class SubscribeController {

	@Autowired
	private SubscribesService service;
	
	//20210304 정진하 풀캘린더에 뜨게하기 위함
	@RequestMapping(value="/ajax/taker/{no}/subscriptions", method=RequestMethod.GET)
	@ResponseBody
	public List<SubscriptionDay> getMonthlySubscriptions(@PathVariable int no) throws IOException {
		return service.getSubscriptionDays(no);
	}
	
	//03-04 방현수 추가
	@RequestMapping(value="/subscribe/{productNo}", method=RequestMethod.GET)
	public String subscribe(Subscribe subscribe, Model model, HttpSession session , @PathVariable int productNo) {
		 
			 //구현해야 하는 내용 -> 필요한 정보
		 
		 /*
		  *  1. 유저 정보를 통한 배송지 정보 출력 -> 유저 번호 위한 HttpSession, 배송지 정보 위한 Model 필요 
		  *  2. 이전 구독
		 *	 상세 페이지에서 넘어온 파라미터(유저가 선택한 옵션)를 받아서 출력 -> Subscribe VO 
		 *	3. 구독 서비스의 상세 정보 ->
		 *   subsNo를 통해 select 후 출력 -> Model 필요
		 */
			 
		//서블릿과 달리 session 저장 안해도 바로 불러올 수 있다. 멤버 정보를 얻어옴
		Member loginMember = (Member) session.getAttribute("loginMember");
		System.out.println(loginMember.getNo());
		 
		// 유저 배송지 
		model.addAllAttributes(service.applySubscribes(loginMember.getNo(), productNo));
		 
		return "/subscribe"; 
	}
	
	
	@RequestMapping(value="/subscribe", method=RequestMethod.POST)
	public String subscribe(HttpSession session, TakerAddr takerAddr,
			@RequestParam(required = false) String addDeliveryList, @RequestParam(required = false) String noAddr) {
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		System.out.println(addDeliveryList);
		System.out.println(takerAddr.getType());
		service.registerSubscribe(loginMember.getNo(), takerAddr, addDeliveryList, noAddr);
		
		return "redirect:/index";
	}
	//03-04 방현수 추가 end
	
	//-- 송진현 --//
	//구독상품 detail
	@RequestMapping(value="/taker/subscribe/{productNo}",method=RequestMethod.GET)
	public String adad(Model model,@PathVariable int productNo) {
		
		model.addAllAttributes(service.getProductDetail(productNo));
		
		return "subscribeDetail";
	}
	//-- 03-04 송진현 --//
	//03-04 이소현 _ 카테고리 있는 메인 목록 페이지
	@RequestMapping(value="/{category}/{categoryNo}/page/{page}", method = RequestMethod.GET)
	public String mainList(@PathVariable String category, @PathVariable int categoryNo, @PathVariable int page, Model model) {
		
		System.out.println(category);
		System.out.println(categoryNo);
		
		model.addAllAttributes(service.getProductListByCategory(category, categoryNo, page)); 

		return "category_list";
		
	}
	// 03-05 박형우 추가
	
	//구독 등록 폼
		@RequestMapping(value="/subscription/{category}/register", method = RequestMethod.GET)
		private String giverSubsRegisterForm(@PathVariable int category, Model model) {
			model.addAllAttributes(service.showRegisterSubsForm(category));
			return "giverSubsRegisterForm";
		}
		//210304 박형우------------------------------------------------------
		
		//해당 시,군의 속하는 Json
		@RequestMapping(value="/ajax/subState", method = RequestMethod.GET)
		@ResponseBody
		private List<Region> subStateJson(@RequestParam int stateNo){
			return service.getSubStateJson(stateNo);
		}
		//210304 박형우------------------------------------------------------

		//이미지 업로드와 Json
		@RequestMapping(value="/ajax/uploadImage", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		private String uploadImage(String type, MultipartFile uploadImg, HttpServletRequest request) throws Exception{
			// 서버
			ServletContext application = request.getServletContext();
		
			// 기본경로
			String rootPath = application.getRealPath("/");
		
			// 업로드 폴더 경로
			String uploadPath = rootPath + "img" + File.separator + "upload" + File.separator;
		
			// 파일의 실제 이름
			String fileName = uploadImg.getOriginalFilename();
		
			// 파일 객체 생성
			File file = new File(uploadPath + fileName);
		
			// 파일이름이 같다면 숫자가 붙음
			file = FileRenameUtil.rename(file);
			
			// 임시폴더에 우리 업로드폴더로 이동
			uploadImg.transferTo(file);
			
			switch(type) {
			case "PR":
				String resizePath = rootPath + "img" + File.separator + "resize" + File.separator;
				ResizeImageUtil.resize(file.toString(), resizePath + file.getName(), 100);
				break;
			default: 
				break;
			}
			
			return "{\"imageName\":\""+file.getName()+"\"}";
		}
		//210304 박형우------------------------------------------------------

		//구독 등록하기
		@RequestMapping(value="/giver/subscription", method = RequestMethod.POST)
		private String uploadSubs(HttpSession session, Product product, String editorContent, int[] days, int[] deliveryAvailSubState, int[] deliveryAvailTax) {
			
			Member loginMember=(Member)session.getAttribute("loginMember");
			System.out.println(loginMember.getNo()+"기버번호");
			System.out.println(product.getCategoryNo()+"카테고리번호");
			System.out.println(product.getName()+"상품명");
			System.out.println(product.getPrice()+"가격");
			System.out.println(product.getDiscount()+"할인가");
			System.out.println(product.getDateAvail() +"날짜");
			System.out.println(product.getSalesQty()+"세일즈 qty");
			System.out.println(product.getReqMsg()+"요청메세지");
			System.out.println(product.getPhoto()+"썸네일");
			System.out.println(editorContent+": 컨트롤러에서 상세");
			System.out.println(product.getInstruction()+"제품이미지");
			
			boolean result = service.registerProduct(loginMember, product, editorContent, days, deliveryAvailSubState, deliveryAvailTax);
			
			return "redirect:/giver/"+loginMember.getNo();
		}
		//210304 박형우------------------------------------------------------
		
		//카테고리 선택 폼
		@RequestMapping(value="/category", method = RequestMethod.GET)
		private String registerCategoryForm() {
			return "registerCategoryForm";
		}
		//210305 박형우------------------------------------------------------
		
		// 03-05 박형우 추가 end
	
	
}
