package com.springbook.biz.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.sch.SchVO;
import com.springbook.biz.sch.ScheduleService;

@Controller
public class ScheduleController {
	@Autowired
	ScheduleService scheduleService;
	
	@RequestMapping("insertSchedule.do")
	public String insertSchedule(SchVO vo,Model model){
		System.out.println(vo.getSch_date());
		scheduleService.insertSchedule(vo);
		return "index.jsp";
	}
	
}
