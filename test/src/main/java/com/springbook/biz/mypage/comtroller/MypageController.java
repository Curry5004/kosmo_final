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
public class MypageController {
	@Autowired
	MypageService mypageService;
	
	@RequestMapping("/getUserInfo.do")
	public String getParty(UserVO vo,Model model,HttpServletRequest request){
		System.out.println(vo.toString());
		HttpSession session=request.getSession();
		String user_Id = (String) session.getAttribute("user_Id");
		vo.setUser_Id(user_Id);
		System.out.println(vo.toString());
		UserVO getUserVO = mypageService.getUserInfo(vo);
		System.out.println(getUserVO.toString());
		model.addAttribute("user",getUserVO);
		return "mypageInfo.jsp";
	}

}
