package com.springbook.biz.admin.controller;




import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.admin.AdminService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.PageVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminSevice;
	
	@RequestMapping("/getAdminMemberList.do")
	public String getAdminMemberList(BoardVO vo, Model model, PageVO page, HttpServletRequest request) {
		
		
		 //vo.getPartId();
		System.out.println("보드리스트 진입 완료");
		int count = adminSevice.getAdminMemberListCnt();
		String pageNo = page.getPageNo();
		System.out.println(pageNo);
		int currentPage = 1;
		int listSize = 6;
		int pageSize = 5;
		if(pageNo != null) {
			currentPage = Integer.parseInt(pageNo);
		}
		int startRow = (currentPage-1) * listSize;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("listSize", listSize);
		
		
		PageVO pages = new PageVO(count, currentPage, listSize, pageSize);
		System.out.println(pages.getTotal());
		System.out.println(count);
		
		
		model.addAttribute("memberList", adminSevice.getAdminMemberList(map));
		model.addAttribute("pages", pages);
		model.addAttribute("pageName", "Admin) 회원관리.");
		return "memberList.jsp";
		
	}
	
}
