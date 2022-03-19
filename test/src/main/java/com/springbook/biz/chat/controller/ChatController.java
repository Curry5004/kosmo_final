package com.springbook.biz.chat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mysql.cj.x.protobuf.MysqlxCrud.Insert;
import com.springbook.biz.chat.ChatService;
import com.springbook.biz.chat.ChatVO;
import com.springbook.biz.memberList.MemberListService;
import com.springbook.biz.memberList.MemberListVO;
import com.springbook.biz.user.UserVO;
@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@Autowired
	MemberListService memberListService;
	
	
	@RequestMapping("chatting.do")
	public String chat(Model model, HttpSession session , MemberListVO vo, HttpServletRequest request){
		UserVO userVO =(UserVO)session.getAttribute("user");
		if(userVO!=null){
			vo.setPARTY_ID(Integer.parseInt(request.getParameter("party_id")));
			List<MemberListVO> list=memberListService.getJoinMemberList(vo);
			List<String> idList =new ArrayList<>();
			for(MemberListVO v:list){
				idList.add(v.getUSER_ID());
			}
			model.addAttribute("idList",idList);
			System.out.println(idList.toString());
			return "chat.jsp";
			}
		else {
			return "login.do";
		}
	}
	
	@RequestMapping("insertChat.do")
	public void insertChat(@RequestBody ChatVO vo, Model model,HttpSession session){
//		UserVO userVO= (UserVO)session.getAttribute("user"); // 로그인세션에서 유저 가져오기
//		vo.setUser_id(userVO.getUser_Id());
//		vo.setUser_name(userVO.getName());
		
		 // 임의의 파티값 1
		
		System.out.println(vo.toString());
		chatService.insertChat(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="getChatList.do",produces = "application/text; charset=UTF-8")
	public String getChatList(@RequestBody ChatVO vo, Model model){
		
	
		Gson gson = new Gson();
		
		String json = gson.toJson(chatService.getChatList(vo));
		System.out.println(json);
		
		System.out.println(chatService.getChatList(vo).toString());
		return json;
		
	}
}
