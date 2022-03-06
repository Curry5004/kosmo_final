package com.springbook.biz.party.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.party.PageVO;
import com.springbook.biz.party.PartyService;
import com.springbook.biz.party.PartyVO;

@Controller
public class PartyController {
	@Autowired
	private PartyService partyService;
	
	@RequestMapping(value="/getPartyList.do", method=RequestMethod.GET)
	public String getPartyList(PartyVO vo, Model model, PageVO page){
		String category_name=vo.getCATEGORY_NAME();
		String search_keyword=vo.getSEARCH_KEYWORD();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("CATEGORY_NAME", category_name);
		map.put("SEARCH_KEYWORD", search_keyword);
				
		int count = partyService.getPartyCnt(map);
		String pageNo = page.getPageNo();
		int currentPage = 1;
		int listSize = 3;
		int pageSize = 5;
		if(pageNo != null){
			currentPage = Integer.parseInt(pageNo);
		}
		int startRow = (currentPage-1) * listSize;
		map.put("START_ROW", startRow);
		map.put("LIST_SIZE", listSize);
		
		PageVO pages = new PageVO(count, currentPage, listSize, pageSize);		
		model.addAttribute("PartyList", partyService.getPartyList(map));	
		model.addAttribute("pages", pages);		
		return "search.jsp";
	}	
}
