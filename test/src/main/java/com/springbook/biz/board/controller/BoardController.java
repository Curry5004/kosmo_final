package com.springbook.biz.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.PageVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/getBoardList.do", method=RequestMethod.GET)
	public String getBoardList(BoardVO vo, Model model, PageVO page) {
		 //vo.getPartId();
		int party_id=vo.getParty_id();
		int count = boardService.getBoardCnt(vo);
		String pageNo = page.getPageNo();
		System.out.println(pageNo);
		int currentPage = 1;
		int listSize = 3;
		int pageSize = 5;
		if(pageNo != null) {
			currentPage = Integer.parseInt(pageNo);
		}
		int startRow = (currentPage-1) * listSize;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("party_id", party_id);
		map.put("startRow", startRow);
		map.put("listSize", listSize);
		
		
		PageVO pages = new PageVO(count, currentPage, listSize, pageSize);
		System.out.println(pages.getTotal());
		System.out.println(count);
		
		
		model.addAttribute("boardList", boardService.getBoardList(map));
		model.addAttribute("pages", pages);
		return "boardList.jsp";
		
	}
	@RequestMapping(value="/insertBoard.do", method=RequestMethod.POST)
	public String insertBoard(BoardVO vo, Model model, HttpServletRequest request) {
		boardService.insertBoard(vo);
		return "boardList.jsp";
	}
}
