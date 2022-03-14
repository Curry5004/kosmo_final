package com.springbook.biz.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.chat.ChatService;
import com.springbook.biz.chat.ChatVO;
import com.springbook.biz.user.UserVO;

@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@RequestMapping("insertChat.do")
	public String insertChat(ChatVO vo, Model model,HttpSession session){
		UserVO userVO= (UserVO)session.getAttribute("user"); // 로그인세션에서 유저 가져오기
		vo.setUser_id(userVO.getUser_Id());
		vo.setUser_name(userVO.getName());
		
		vo.setParty_id(1); // 임의의 파티값 1
		
		chatService.insertChat(vo);
		return "chat.jsp";
	}
	
	@RequestMapping("insertChat2.do")
	@ResponseBody
	public void insertChat2(ChatVO vo, Model model,HttpSession session){
		UserVO userVO= (UserVO)session.getAttribute("user"); // 로그인세션에서 유저 가져오기
		vo.setUser_id(userVO.getUser_Id());
		vo.setUser_name(userVO.getName());
		
		vo.setParty_id(1); // 임의의 파티값 1
		
		chatService.insertChat(vo);
		
	}
}