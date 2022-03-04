package com.springbook.biz.memberList.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.memberList.MemberListService;
import com.springbook.biz.memberList.MemberListVO;

@Controller
public class MemberListController {
	@Autowired
	MemberListService memberListService;
	
	@RequestMapping("/joinParty.do")
	public String joinParty(MemberListVO vo, Model model){
		memberListService.joinParty(vo);
		return "index.jsp";
	}
	
}
