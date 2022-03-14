package com.springbook.biz.memberList.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
	public String joinParty(MemberListVO vo, Model model,HttpSession session){
		UserVO userVO=(UserVO)session.getAttribute("user");
		if(userVO!=null){
			System.out.println("유저아이디: "+userVO.getUser_Id());
			vo.setUSER_ID(userVO.getUser_Id());
			memberListService.joinParty(vo);
			return "home.do";
		}else
			return "login.do";
	}
	@RequestMapping("/deletePartyMember.do")
		public String deletePartyMember(MemberListVO vo, Model model,HttpSession session){
			System.out.println("파티멤버 탈퇴 ");
			UserVO user=(UserVO)session.getAttribute("user");
			System.out.println("유저아이디: "+user.getUser_Id());
			vo.setUSER_ID(user.getUser_Id());
			memberListService.deletePartyMember(vo);
			return "getParty.do?PARTY_ID="+vo.getPARTY_ID();
	}
	@RequestMapping("/memberFav.do")
		public String  memeberFav(MemberListVO vo,Model model,HttpSession session){
			UserVO userVO=(UserVO)session.getAttribute("user");
			if(userVO!=null){
				memberListService.memberFav(vo);
				return "getParty.do?PARTY_ID="+vo.getPARTY_ID();
			}else {
				return "login.do";
			}
	}
	@RequestMapping("/deleteMemberFav.do")
	public String deleteMemberFav(MemberListVO vo, Model model,HttpSession session){
		System.out.println("찜하기 삭제 테스트 ");
		UserVO user=(UserVO)session.getAttribute("user");
		System.out.println("유저아이디: "+user.getUser_Id());
		vo.setUSER_ID(user.getUser_Id());
		memberListService.deleteMemberFav(vo);
		return "getParty.do?PARTY_ID="+vo.getPARTY_ID();
}
}
