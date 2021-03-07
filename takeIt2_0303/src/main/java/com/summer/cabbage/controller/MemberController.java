package com.summer.cabbage.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.summer.cabbage.service.MembersService;
import com.summer.cabbage.util.FileRenameUtil;
import com.summer.cabbage.util.ResizeImageUtil;
import com.summer.cabbage.vo.Giver;
import com.summer.cabbage.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MembersService service;

	@RequestMapping(value={"/","/index"}, method=RequestMethod.GET)
	public String index(Model model) {
		model.addAllAttributes(service.showMainForm());
		return "index";
	}
	
	@RequestMapping(value="/log",method=RequestMethod.GET)
	public String loginForm() {
		return "/login";
	}
	

	
	@RequestMapping(value="/log",method=RequestMethod.POST)
	public String login(Member member, HttpSession session, RedirectAttributes ra) {
		// 서비스 메서드 이용해서 로그인 처리 해주기 
	
		session.setAttribute("loginMember",service.login(member));
	
		Member loginMember=(Member)session.getAttribute("loginMember");
		
		if(loginMember!=null) {
			if(loginMember.getType().equals("G")) {
				// 회원의 유형이 기버일 경우 
				// 기버 마이페이지로 가자 
				System.out.println("기버마이페이지 아직 페이지 없어서 잘되나 그냥 확인용");
				return "redirect:/giver/"+member.getNo();
			}else{
				// 회원의 유형이 테이커 일 경우 
				return "redirect:/index";
			}
		}
		else {
			ra.addFlashAttribute("msg", "아이디 혹은 비밀번호 혹은 회원 유형선택이 틀렸습니다.");
			return "redirect:/log";
		}
	}
	
	// 03-03 강필규 추가
	@RequestMapping(value="/find/password",method = RequestMethod.GET )
	public String findPassword(){
		
		return "findPassword";
		
	}
	
	@RequestMapping(value="/find/password",method = RequestMethod.PUT )
	public String findPassword(Member member){
		
		service.findPw(member);
		
		return "redirect:/log";
		
	}
	// 03-03 강필규 추가 end
	
	//03-04 이아림 추가
	//회원가입 유형 선택 후 테이커 회원가입 창 이동
	@RequestMapping(value="/taker/signUp", method=RequestMethod.GET)
	public String takerSignUp() {
		return "signUpTaker";
	}//takerSignUp() end
	
	//아이디 체크 메서드
	@RequestMapping(value="/ajax/check/id", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String checkId(String id){
		return "{\"result\":"+service.checkId(id)+"}";
	}
	
	//닉네임 체크 메서드
	@RequestMapping(value="/ajax/check/nickname", 
			method=RequestMethod.GET,
			produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String checkNickname(String nickname) {
		return "{\"result\":"+service.checkNickname(nickname)+"}";
	}//checkNickname() end
	
	//03-04 이아림 추가 end
	
	//-- 송진현 03-04 --//
	
	//회원가입 giver인지 taker인지 선택하는 jsp
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String sdfsf() {
		return "signupSelect";
	}
	
	//giver 회원가입 시작
	@RequestMapping(value="/giver/signUp/step1", method=RequestMethod.GET)
	public String sdfqsf() {
		return "signupGiverStep1";
	}
	
	//giver 사업자번호 등록여부 확인 JSP
	@RequestMapping(value="/giver/signUp/step2", method=RequestMethod.GET)
	public String sdfswf() {
		return "signupGiverStep2";
	}
	
	//giver 사업자번호 등록여부 확인 후 
	//등록 된 번호이면 리다이렉트, 등록되지 않은 번호이면 다음 JSP
	@RequestMapping(value="/giver/signUp/step3", method=RequestMethod.GET)
	public String sdfesf(Model model, Giver giver,RedirectAttributes ra) {
		
		Giver giverBusinessNum = service.getGiverBusinessNum(giver);
		if(giverBusinessNum!=null) {
			ra.addFlashAttribute("msg", "이미 등록된 사업자 번호입니다.");
			return "redirect:/signupGiverStep2";
		}else {
			model.addAttribute("giver", giver);
			return "signupGiverStep3";
		}
	}
	
	//giver 회원가입 중 상호명 중복확인
	@RequestMapping(value="/ajax/check/businessName", 
			method=RequestMethod.GET,
			produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String checkBusinessName(String businessName) {
		return "{\"result\":"+service.checkBusinessName(businessName)+"}";
	}
	
	//giver 회원가입 중 ID 중복확인
	@RequestMapping(value="/ajax/giver/check/id", 
			method=RequestMethod.GET,
			produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String checkGiverId(String id) {
		return "{\"result\":"+service.checkId(id)+"}";
	}
	
	//giver 회원가입 중 프로필 사진 업로드
	@RequestMapping(value="/ajax/profile",
			method=RequestMethod.POST,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	private String uploadProfile(String type, 
			MultipartFile profile, 
			HttpServletRequest request) throws Exception {
		// 서버
		ServletContext application = request.getServletContext();
		// 기본경로
		String rootPath = application.getRealPath("/");
		// 업로드 폴더 경로
		String uploadPath = rootPath + "img" + File.separator + "upload" + File.separator;
		// 파일의 실제 이름
		String fileName = profile.getOriginalFilename();
		// 파일 객체 생성
		File file = new File(uploadPath + fileName);
		// 파일이름이 같다면 숫자가 붙음
		file = FileRenameUtil.rename(file);
		// 임시폴더에 우리 업로드폴더로 이동
		profile.transferTo(file);
		// 리사이즈가 필요한 경우 하면 됨
		String resizePath = rootPath + "img" +
		File.separator + "members" + File.separator;
		// 리사이즈
		ResizeImageUtil.resize(file.toString(), resizePath + file.getName(), 200);
		return "{\"profileName\":\""+file.getName()+"\"}";
	}
	
	//giver Insert
	@RequestMapping(value="/giver/signUp/step3", method=RequestMethod.POST)
	public String sdfwewesf(Member member, Giver giver) {
		service.singUpGiver(member,giver);
		return "redirect:/index";
	}
	//-- 03-04 송진현 --//
	
		
	
	
}
