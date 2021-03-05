package com.summer.cabbage.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.summer.cabbage.service.TakersService;
import com.summer.cabbage.util.FileRenameUtil;
import com.summer.cabbage.util.ResizeImageUtil;
import com.summer.cabbage.vo.Member;
import com.summer.cabbage.vo.Taker;

@Controller
public class TakerController {
	
	@Autowired
	private TakersService service;
	
	// 테이커 마이페이지로 가는 메서드 03-04 오승주
	@RequestMapping(value="/taker/{takerNo}",method=RequestMethod.GET)
	public String takerMypage(@PathVariable int takerNo) {
		System.out.println(takerNo);
		return "takerMypage";
	}
	
	// 테이커 마이페이지에서 내 구독 상품과 히스토리 출력하기  03-04 오승주
	@RequestMapping(value="/taker/{takerNo}/items", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> mySubList(@PathVariable int takerNo,String status,int page){
		///taker/"+${taker.no}+"/items

		return service.getSubList(takerNo,status,page);
	}
	
	//정진하 20210304 테이커 마이페이지 로그인 후 헤더에서 이동함
		@RequestMapping(value="/taker2/{no}", method=RequestMethod.GET)
		public String takerMyPage(@PathVariable int no, Model model) {
			
			model.addAttribute("taker", service.getTaker(no));
			
			return "takerMyPage2";
		}
		//테이커 마이페이지 프로필사진 수정
		@RequestMapping(value="/ajax/taker/{no}/profile", method=RequestMethod.POST, produces ="application/json;charset=UTF-8")
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
		}
		
		//테이커 닉네임 유효성 검사
		@RequestMapping(value="/ajax/signUp/check/nickname", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
		@ResponseBody	//datatype을 json으로 했기 때문에. http프로토콜은 요청 응답 프로토콜이다. 헤더와 바디로 구성되어 있음.
		//html도 결국엔 헤더와 바디로 구성되어 있음. 
		public String checkNickname(String nickname) {//private로 만들어도 됨
			return "{\"result\":"+service.checkNickname(nickname)+"}";
			//Member member로 인자 넣어줘도 됨.
			
		}
		
		@RequestMapping(value="/ajax/taker/{no}/nickname", method=RequestMethod.POST, produces ="application/json;charset=UTF-8")
		@ResponseBody
		public String updateNickname(Taker taker, @PathVariable int no) {
			
			service.updateNickname(taker);
			
			return "{\"nickname\":\""+taker.getNickname()+"\"}";
			
		}
		//정진하 end
}
