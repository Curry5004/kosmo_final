package com.springbook.biz.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	

	@RequestMapping(value="/registry.do", method=RequestMethod.POST)	
	public String insertUser(UserVO vo, Model model) {
		System.out.println("회원가입 시작");
		userService.insertUser(vo);
		System.out.println("insert 완료");
		return "registryPage.jsp";
	}
}
