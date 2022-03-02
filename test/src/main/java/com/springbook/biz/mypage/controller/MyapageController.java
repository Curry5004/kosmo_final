package com.springbook.biz.mypage.controller;


import java.util.HashMap;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.common.vo.ResultBody;
import com.springbook.biz.common.vo.UserVO;
import com.springbook.biz.mypage.vo.req.ReqGetSearchGroupVO;

@Controller
public class MyapageController {

	@RequestMapping(path="mypage.do", method=RequestMethod.GET)
	public String getMypage(Model model) throws Exception {
		UserVO userVO = new UserVO();
		model.addAttribute("userVO", userVO);
		
		return "search.jsp"; //_> res vo 필요 없음
	}
	
	@RequestMapping(path="/groups.do", method=RequestMethod.GET)
	public @ResponseBody ResultBody getSearchGroup( ReqGetSearchGroupVO reqGetSearchGroupVO ) throws Exception { 
		
		String category = reqGetSearchGroupVO.getCategory();
		String keyowrd = reqGetSearchGroupVO.getKeyword();
		
		
		
		ResultBody resultBody = new ResultBody();
		
		return resultBody;//@ResponseBody  가 있으면 resVo 필요
	}
}
