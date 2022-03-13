package com.springbook.biz.report.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.common.Consts;
import com.springbook.biz.party.PageVO;
import com.springbook.biz.report.QnaVO;
import com.springbook.biz.report.ReportService;
import com.springbook.biz.report.ReportVO;
import com.springbook.biz.user.UserVO;

@Controller
public class ReportController {
	@Autowired
	ReportService reportService;
	
	@RequestMapping("/report.do")
	public String getReportList(ReportVO vo,Model model, PageVO page,QnaVO qna, HttpServletRequest request) throws Exception{
//		UserVO userVO = (UserVO)request.getSession().getAttribute(Consts.SESSION_KEY_USER);//세션에서 유저 VO 가져옴
		UserVO userVO = (UserVO)request.getSession().getAttribute("user");//세션에서 유저 VO 가져옴
		if(ObjectUtils.isEmpty(userVO)) return "index.jsp";// 세션에 유저 정보가 없으면 메인 화면으로
		
		Map<String, Object> map = new HashMap<>(); // xml 로 전달할 파라미터를 생성
		
		int count = reportService.getReportCnt(map);
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
		
		
		map.put("REP_BOA_WRITER", userVO.getUser_Id());
		
		ReportVO reportVO = new ReportVO();
		reportVO.setReportComList(reportService.getReportList(map));
		reportVO.setQnaList(reportService.getQnaList(map));
		
	
		model.addAttribute("reportVO", reportVO); // ReportCom.jsp로 전달할 객체를 model 에 추가 함
		model.addAttribute("user_id", userVO.getUser_Id());
		
		model.addAttribute("pages", pages);
		return "Report.jsp";
	}
}
