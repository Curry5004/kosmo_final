package com.springbook.biz.login.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAO;

@Controller
public class LoginController {
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginView(UserVO vo){
		System.out.println("로그인 처리");
		vo.setUser_Id("test");
		vo.setPassword("test123");
		return "login.jsp";
	}
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserVO vo,UserDAO userDAO,HttpSession session){
		UserVO user = userDAO.getUser_id(vo);
		System.out.println("로그인 인증처리");
		if(userDAO.getUser_id(vo)!=null){
			session.setAttribute("uesrName",user.getName());
			return "index.do";
		}
		else return "login.jsp";
	}
}

