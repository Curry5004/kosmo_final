package com.springbook.biz.schedule.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.sch.SchVO;
import com.springbook.biz.sch.ScheduleService;
import com.springbook.biz.user.UserVO;

@Controller
public class ScheduleController {
	@Autowired
	ScheduleService scheduleService;
	
	@RequestMapping("insertSchedule.do")
	public String insertSchedule(SchVO vo,Model model,HttpSession session){
		UserVO userVO=(UserVO)session.getAttribute("user");
		if(userVO!=null){
			scheduleService.insertSchedule(vo);
			return "index.jsp";
		}else {
			return "login.do";
		}
	}
	
	@RequestMapping("calendar.do")
	public String getScheduleList(SchVO vo,Model model,HttpServletRequest request){
		if(request.getParameter("year")!=null){
			System.out.println(request.getParameter("year")+" "+request.getParameter("month")+" "+request.getParameter("day"));
			model.addAttribute("year", request.getParameter("year"));
			model.addAttribute("month", request.getParameter("month"));
			model.addAttribute("day", request.getParameter("day"));
			vo.setYear(request.getParameter("year"));
			switch (request.getParameter("month")) {
			case "1":
				vo.setMonth("01");
				break;
			case "2":
				vo.setMonth("02");
				break;
			case "3":
				vo.setMonth("03");
				break;
			case "4":
				vo.setMonth("04");
				break;
			case "5":
				vo.setMonth("05");
				break;
			case "6":
				vo.setMonth("06");
				break;
			case "7":
				vo.setMonth("07");
				break;
			case "8":
				vo.setMonth("08");
				break;
			case "9":
				vo.setMonth("09");
				break;
			default:
				vo.setMonth(request.getParameter("month"));
				break;
			}
			
		}else{
		LocalDate now = LocalDate.now();
		String date=now.toString();
		String[] dateList=date.split("-");
		
		model.addAttribute("year", dateList[0]);
		model.addAttribute("month", dateList[1]);
		model.addAttribute("day", dateList[2]);
		
		vo.setYear(dateList[0]);
		vo.setMonth(dateList[1]);
		}
		
		
		model.addAttribute("party_id", request.getParameter("party_id"));
		model.addAttribute("getMemberName",scheduleService.getMemberName(vo));
		List<SchVO> getList=scheduleService.getScheduleList(vo);
		model.addAttribute("SchduleList", getList);
		List<String> checkList =new ArrayList<>();
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd");
		
		for(SchVO s:getList){
			String tmpDate=simpleDateFormat.format(s.getSch_date());
			checkList.add(tmpDate);
		}
		model.addAttribute("checkList", checkList);
		return "Calendar.jsp";
	}
	
}
