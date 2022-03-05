package com.springbook.biz.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	

	@RequestMapping(value="/registry.do", method=RequestMethod.POST)	
	public String insertUser(UserVO vo, Model model, HttpServletRequest request) {
		//form에서 전달받은 이미지가 있다면
		if(vo.getMbti_root().getSize()!=0){
			
			System.out.println("mbti 사진 업로드 시작");
			// 저장할 경로 가져오기
			String path = request.getSession().getServletContext().getRealPath("resources"); // 프로젝트내 resource 폴더의 실제경로
			String root = path + "\\uploadFiles" ; // 저장할 위치
			
			File file = new File(root); //경로생성용 파일 생성
			
			// 만약 uploadFiles 폴더가 없으면 생성해라 라는뜻
			if(!file.exists()) file.mkdirs();
			
			// 업로드할 폴더 설정
			String originFileName = vo.getMbti_root().getOriginalFilename(); // 원래 파일이름
			String ext = originFileName.substring(originFileName.lastIndexOf(".")); 
			String ranFileName = UUID.randomUUID().toString() + ext; //랜덤변수가 붙은 파일이름
			
			File changeFile = new File(root + "\\" + ranFileName); //파일생성 
			
			
			// 파일업로드
			try {
				vo.getMbti_root().transferTo(changeFile); //파일 업로드
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			
			System.out.println("mbti 이미지 에러 ");
			return "index.jsp";
			}
		
		//VO 필드변경
		String oldName =root + "\\" + ranFileName;	 //변경전 이름
		String changeName=oldName.replaceAll("\\\\", "\\\\\\\\"); //DB와 string에서 \를 인식 못하기 때문에 \\로 바꿔줘야함, \\를 인식하기 위해선 \\\\를 적어야함
		vo.setMbti_Path(changeName); //VO갱신
		System.out.println("mbti 이미지 삽입완료 ");
		}
		
		if(vo.getProfile_root().getSize()!=0){
			
			
			// 저장할 경로 가져오기
			String path = request.getSession().getServletContext().getRealPath("resources"); // 프로젝트내 resource 폴더의 실제경로
			String root = path + "\\uploadFiles" ; // 저장할 위치
			
			File file = new File(root); //경로생성용 파일 생성
			
			// 만약 uploadFiles 폴더가 없으면 생성해라 라는뜻
			if(!file.exists()) file.mkdirs();
			
			// 업로드할 폴더 설정
			String originFileName = vo.getProfile_root().getOriginalFilename(); // 원래 파일이름
			String ext = originFileName.substring(originFileName.lastIndexOf(".")); 
			String ranFileName = UUID.randomUUID().toString() + ext; //랜덤변수가 붙은 파일이름
			
			File changeFile = new File(root + "\\" + ranFileName); //파일생성 
			
			
			// 파일업로드
			try {
				vo.getProfile_root().transferTo(changeFile); //파일 업로드
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			
			System.out.println("프로필 이미지 에러 ");
			return "index.jsp";
			}
		
		//VO 필드변경
		String oldName =root + "\\" + ranFileName;	 //변경전 이름
		String changeName=oldName.replaceAll("\\\\", "\\\\\\\\"); //DB와 string에서 \를 인식 못하기 때문에 \\로 바꿔줘야함, \\를 인식하기 위해선 \\\\를 적어야함
		vo.setProfile_Image(changeName); //VO갱신
		System.out.println("프로필 이미지 갱신완료");
		}
		
		
		System.out.println("회원가입 시작");
		userService.insertUser(vo);
		System.out.println("insert 완료");
		return "index.jsp";
	}
		
		// 로그인 화면
		@RequestMapping("/login.do")
		public String login() {
			return "login.jsp"; // main/webapp/login.jsp로 포워드
		}
		
		// 로그인 처리
		@RequestMapping("/loginCheck.do")
		public ModelAndView loginCheck(UserVO vo, HttpSession session) {
			boolean result = userService.loginCheck(vo, session);
			ModelAndView mav = new ModelAndView();
			if (result == true) { // 로그인 성공
				// main.jsp로 이동
				mav.setViewName("index");
				mav.addObject("msg", "success");
				
			} else { // 로그인 실패
				// login.jsp로 이동
				mav.setViewName("webapp/login");
				mav.addObject("msg", "failure");
			}
			return mav;
		}
		
		// 로그아웃 처리
		@RequestMapping("logout.do")
		public ModelAndView logout(HttpSession session) {
			UserService.logout(session);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("webapp/login");
			mav.addObject("msg", "logout");
			return mav;
		}
}
		