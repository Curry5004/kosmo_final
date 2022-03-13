package com.springbook.biz.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.admin.AdminService;
import com.springbook.biz.admin.AdminVO;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/getAdminPage.do", method=RequestMethod.GET)
	public String getAdminList(AdminVO vo,Model model){
		model.addAttribute("getAdminList",adminService.getAdminList(vo));
		return "adminPage.jsp";
	}
	@RequestMapping(value="/getUpdateAdminPage.do",method=RequestMethod.GET)
	public String UpdateAdminPage(AdminVO vo,Model model){
		adminService.UpdateAdminPage(vo);
		return "redirect: adminPage.jsp";
	}
	
	
}
