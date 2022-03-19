package com.springbook.biz.main.controller;



import java.util.HashMap;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.main.CategoryVO;
import com.springbook.biz.main.MainService;
import com.springbook.biz.main.MbtiVO;
import com.springbook.biz.party.PartyVO;
import com.springbook.biz.user.UserVO;

@Controller
public class MainController {
	@Autowired
	MainService mainService;
	

	@RequestMapping("/writeParty.do")
	public String writeParty(MbtiVO vo,CategoryVO vo2,Model model){ 
		model.addAttribute("MbtiList",mainService.getMbtiList(vo)); //MbtiList model 추가	
		model.addAttribute("CategoryList",mainService.getCategoryList(vo2)); //카테고리리스트  model 추가
		return "writeParty.jsp";
	}
	@RequestMapping(value="/registry_form.do", method=RequestMethod.GET)
	public String registryForm(MbtiVO vo,Model model){
//		System.out.println("로그인 페이지 진입 완료");
		model.addAttribute("MbtiList",mainService.getMbtiList(vo)); //MbtiList model 추가
		return "registryPage.jsp";
	}
	
	@RequestMapping("home.do")
	public String homePage(Model model,HttpSession session,CategoryVO vo){
		UserVO userVO=(UserVO)session.getAttribute("user");
		if(userVO!=null){
			Map<String,Object> map=new HashMap<>();
			map.put("mbti_id", userVO.getMbti_Id());
			model.addAttribute("bestList", mainService.searchBestParty(map));
			
		}
		return "home.jsp";
	}
	@RequestMapping("getModal.do")
	public String getCategoryList(CategoryVO vo,Model model){
		model.addAttribute("getModal",mainService.getCategoryList(vo));
		return "navbar.jsp";
	}
}
