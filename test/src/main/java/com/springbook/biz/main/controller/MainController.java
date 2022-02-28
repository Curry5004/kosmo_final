package com.springbook.biz.main.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.main.CategoryVO;
import com.springbook.biz.main.MainService;
import com.springbook.biz.main.MbtiVO;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	
	
	@RequestMapping("/writeParty.do")
	public String writeParty(MbtiVO vo, Model model){
		model.addAttribute("MbtiList",mainService.getMbtiList(vo));
		return "writeParty.jsp";
	}
	

}
