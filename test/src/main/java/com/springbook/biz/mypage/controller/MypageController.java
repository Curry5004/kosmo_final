package com.springbook.biz.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.common.Consts;
import com.springbook.biz.mypage.MypageService;
import com.springbook.biz.user.UserVO;

@Controller
public class MypageController {
	@Autowired
	MypageService mypageService;
	
	@RequestMapping("/mypage.do")
	public String getMypage(Model model, HttpServletRequest request) throws Exception{
		UserVO userVO = (UserVO)request.getSession().getAttribute(Consts.SESSION_KEY_USER);//세션에서 유저 VO 가져옴
		if(ObjectUtils.isEmpty(userVO)) return "index.jsp"; // 세션에 유저 정보가 ㅇ벗으면 메인 화면으로ㅓ
		
		Map<String, Object> map = new HashMap<>(); // xml 로 전달할 파라미터를 생성
		map.put("USER_ID", userVO.getUser_Id());
		model.addAttribute("mypageVO", mypageService.getMypage(map)); // mypage.jsp로 전달할 객체를 model 에 추가 함
		model.addAttribute("profile_image", userVO.getProfile_Image());
		model.addAttribute("user_id", userVO.getUser_Id());
		
		
		return "mypage.jsp";
	}
}
