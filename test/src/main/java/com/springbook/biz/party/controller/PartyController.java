package com.springbook.biz.party.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.party.PartyService;
import com.springbook.biz.party.PartyVO;

@Controller
public class PartyController {
	@Autowired
	PartyService partyService;
	
	@RequestMapping("/wirteParty.do")
	public String insertParty(PartyVO vo,Model model){
		partyService.insertParty(vo);
		return "index.jsp";
				
	}

}
