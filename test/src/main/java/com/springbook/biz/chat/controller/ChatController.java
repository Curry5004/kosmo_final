package com.springbook.biz.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.springbook.biz.chat.ChatService;
import com.springbook.biz.chat.ChatVO;
import com.springbook.biz.user.UserVO;
@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@RequestMapping("insertChat.do")
	public void insertChat(@RequestBody ChatVO vo, Model model,HttpSession session){
//		UserVO userVO= (UserVO)session.getAttribute("user"); // 로그인세션에서 유저 가져오기
//		vo.setUser_id(userVO.getUser_Id());
//		vo.setUser_name(userVO.getName());
		
		vo.setParty_id(1); // 임의의 파티값 1
		
		System.out.println(vo.toString());
		chatService.insertChat(vo);
	}
	
	@ResponseBody
	@RequestMapping("getChatList.do")
	public String getChatList(@RequestBody ChatVO vo, Model model){
		
	
		Gson gson = new Gson();
		
		String json = gson.toJson(chatService.getChatList(vo));
		System.out.println(json);
		
		System.out.println(chatService.getChatList(vo).toString());
		return json;
		
	}
}
