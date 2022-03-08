package com.springbook.biz.mypage.comtroller;



import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.main.MainService;
import com.springbook.biz.main.MbtiVO;
import com.springbook.biz.mypage.MypageService;
import com.springbook.biz.user.UserVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	MypageService mypageService;
	@Autowired
	private MainService mainService;
	
	@RequestMapping("/getUserInfo.do")
	public String getUserInfo(UserVO vo,Model model,HttpSession session){
		//로그인 된 객체 받아오기.
		UserVO vo2 = (UserVO) session.getAttribute("user");
		model.addAttribute("user", mypageService.getUserInfo(vo2));
		return "mypageInfo.jsp";
	}
	@RequestMapping("/UpdateUserInfoForm.do")
	public String getUserInfo2(MbtiVO vo,Model model,HttpSession session){
		UserVO vo2 = (UserVO) session.getAttribute("user");
		model.addAttribute("user", mypageService.getUserInfo(vo2));
		model.addAttribute("MbtiList",mainService.getMbtiList(vo));
		//3개월 날짜 계산
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String today = sdf.format(date);
						
				Date date2 = vo2.getModified_Day();
				String modi = sdf.format(date2);
						
				int tYear= Integer.parseInt(today.substring(0,4)); 
				int tMonth = Integer.parseInt(today.substring(4,6));
				int mYear = Integer.parseInt(modi.substring(0,4)); 
				int mMonth = Integer.parseInt(modi.substring(4,6)); 
				int month = (tYear - mYear)* 12 + (tMonth  - mMonth);
				boolean mbtiModi = false;
				if (month>=3){
					mbtiModi = true;
				}
				
				model.addAttribute("mbtiModi", mbtiModi);
		
		
		
		
		return "mypageInfoUpdate.jsp";
	}
	@RequestMapping("/UpdateUserInfo.do")
	public String getUserInfo3(UserVO vo,Model model,HttpSession session){
		UserVO vo2 = (UserVO) session.getAttribute("user");
		
		model.addAttribute("user", mypageService.getUserInfo(vo2));
		
		return "mypageInfoUpdate.jsp";
	}
}
