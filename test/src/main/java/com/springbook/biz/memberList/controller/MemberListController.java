package com.springbook.biz.memberList.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.memberList.MemberListService;
import com.springbook.biz.memberList.MemberListVO;
import com.springbook.biz.user.UserVO;

@Controller
public class MemberListController {
	@Autowired
	MemberListService memberListService;
	
	@RequestMapping("/joinParty.do")
	public String joinParty(MemberListVO vo, Model model,HttpServletRequest request){
		HttpSession session =request.getSession();
		UserVO user=(UserVO)session.getAttribute("user");
		System.out.println("유저아이디: "+user.getUser_Id());
		vo.setUSER_ID(user.getUser_Id());
		memberListService.joinParty(vo);
		return "index.jsp";
	}
	@RequestMapping("/deletePartyMember.do")
		public String deletePartyMember(MemberListVO vo, Model model){
			System.out.println("파티멤버 탈퇴 ");
			memberListService.deletePartyMember(vo);
			return "getParty.do?PARTY_ID="+vo.getPARTY_ID();
	}
	@RequestMapping("/memberFav.do")
		public String  memeberFav(MemberListVO vo,Model model){
			memberListService.memberFav(vo);
			return "getParty.do?PARTY_ID="+vo.getPARTY_ID();
	}
}
