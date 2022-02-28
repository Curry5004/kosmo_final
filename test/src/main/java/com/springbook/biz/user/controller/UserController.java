package com.springbook.biz.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/getuserList.do")
	public String getUser(UserVO vo, Model model) {			
		model.addAttribute("userList", userService.getUserList(vo));
		return "userList.jsp";
	}
	
}
