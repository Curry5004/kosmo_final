package com.springbook.biz.schedule.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.board.PageVO;
import com.springbook.biz.sch.SchVO;
import com.springbook.biz.sch.ScheduleService;
import com.springbook.biz.user.UserVO;

@Controller
public class ScheduleController {
	@Autowired
	ScheduleService scheduleService;
	
	@RequestMapping("calendar2.do") 
	public String getScheduleDetail(SchVO vo, Model model, PageVO page ) {
		 //vo.getPartId();
		int party_id=vo.getParty_id();
		int count = scheduleService.getSchCnt(vo);
		int sch_member_current_count = scheduleService.getCurrentMemberCnt(vo);
		String year=vo.getYear();
		String month=vo.getMonth();
		String pageNo = page.getPageNo();
		System.out.println(pageNo);
		int currentPage = 1;
		int listSize = 1;
		int pageSize = 1;
		if(pageNo != null) {
			currentPage = Integer.parseInt(pageNo);
		}
		int startRow = (currentPage-1) * listSize;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("party_id", party_id);
		map.put("startRow", startRow);
		map.put("listSize", listSize);
		map.put("year", year);
		map.put("month", month);
		map.put("sch_id", vo.getSch_id());	
		map.put("sch_member_current_count", sch_member_current_count);
		
		PageVO pages = new PageVO(count, currentPage, listSize, pageSize);
		System.out.println(pages.getTotal());
		System.out.println(count);
		System.out.println(vo.getSch_id());
		
		Map<String, SchVO> cntList=new HashMap<String, SchVO>();
		for(SchVO schVO : scheduleService.getCntList(vo)){
			cntList.put(schVO.getUser_id(), schVO);
		}
		
		model.addAttribute("cntList", cntList);
		model.addAttribute("SchDetail", scheduleService.getScheduleDetail(map));
		model.addAttribute("pages", pages);
		return "CalendarDetail.jsp";	
	}
	@RequestMapping("deleteSch.do")
	public String deleteSch(SchVO vo,Model model){
		scheduleService.deleteSch(vo);
		return "redirect:calendar2.do?year=2022&month=03&party_id=1";
	}
	
	@RequestMapping("cntUp.do")
	public String cntUp(SchVO vo,Model model,HttpSession session, PageVO page){
		String pageNo = page.getPageNo();
		UserVO userVO=(UserVO)session.getAttribute("user");
		vo.setUser_id(userVO.getUser_Id());
		scheduleService.schMemberCntUp(vo);
		return "redirect:calendar2.do?year=2022&month=03&party_id=1&pageNo="+pageNo;
	}
	@RequestMapping("cntDown.do")
	public String cntDown(SchVO vo,Model model,HttpSession session, PageVO page){
		String pageNo = page.getPageNo();
		UserVO userVO=(UserVO)session.getAttribute("user");
		vo.setUser_id(userVO.getUser_Id());
		scheduleService.schMemberCntDown(vo);
		return "redirect:calendar2.do?year=2022&month=03&party_id=1&pageNo="+pageNo;
	}
	
	@RequestMapping("insertSchedule.do")
	public String insertSchedule(SchVO vo,Model model){
		System.out.println(vo.getSch_date());
		scheduleService.insertSchedule(vo);
		
		return "index.jsp";
	}
	
	@RequestMapping("calendar.do")
	public String getScheduleList(SchVO vo,Model model,HttpServletRequest request){
		if(request.getParameter("year")!=null){
			System.out.println(request.getParameter("year")+" "+request.getParameter("month")+" "+request.getParameter("day"));
			model.addAttribute("year", request.getParameter("year"));
//			int month=Integer.parseInt(request.getParameter("month"));
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

			System.out.println("깡통");
		LocalDate now = LocalDate.now();
		String date=now.toString();
		String[] dateList=date.split("-");
		
		

		System.out.println(dateList[1]);
		
		model.addAttribute("year", dateList[0]);
		model.addAttribute("month", dateList[1]);
		model.addAttribute("day", dateList[2]);
		
		
		vo.setYear(dateList[0]);
		vo.setMonth(dateList[1]);
		
		}
		model.addAttribute("party_id", request.getParameter("party_id"));
		List<SchVO> getList=scheduleService.getScheduleList(vo);
		System.out.println(scheduleService.getScheduleList(vo).toString());
		model.addAttribute("SchduleList", getList);
		List<String> checkList =new ArrayList<>();
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd");
		
		for(SchVO s:getList){
			String tmpDate=simpleDateFormat.format(s.getSch_date());
			checkList.add(tmpDate);
		}
		System.out.println(checkList.toString());
		model.addAttribute("checkList", checkList);
		return "Calendar.jsp";
	}
	
}
