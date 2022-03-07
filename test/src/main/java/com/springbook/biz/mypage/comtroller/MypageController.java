package com.springbook.biz.mypage.comtroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.mypage.MypageService;
import com.springbook.biz.user.UserVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	MypageService mypageService;
	
	@RequestMapping("/getUserInfo.do")
	public String getParty(UserVO vo,Model model,HttpServletRequest request){
		//로그인 된 객체 받아오기.
		HttpSession session=request.getSession();
		UserVO vo2 = (UserVO) session.getAttribute("user");
		
		//user의 mbti 정보가 id만 있어서 쿼리로 join 한 후 mbti 정보를 가져온다.
		
		System.out.println(vo2.toString());
		return "mypageInfo.jsp";
	}

}
