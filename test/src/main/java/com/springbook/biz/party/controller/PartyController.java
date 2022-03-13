package com.springbook.biz.party.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.w3c.dom.NameList;


import com.springbook.biz.memberList.MemberListService;
import com.springbook.biz.memberList.MemberListVO;
import com.springbook.biz.party.PartyService;
import com.springbook.biz.party.PartyVO;
import com.springbook.biz.user.UserVO;
import com.springbook.biz.party.PartyVO;
import com.springbook.biz.party.PageVO;

@Controller
public class PartyController {
	@Autowired
	PartyService partyService;
	@Autowired
	MemberListService memberListService;
	
	//소모임 작성
	@RequestMapping("/insertParty.do")
	public String insertParty(PartyVO vo,Model model,HttpServletRequest request,MemberListVO vo2){
		UserVO userVO=(UserVO)request.getSession().getAttribute("user");
		if(userVO!=null){
		//form에서 전달받은 이미지가 있다면
			if(vo.getPARTY_TUMB().getSize()!=0){
				
				
				// 저장할 경로 가져오기
				String path = request.getSession().getServletContext().getRealPath("resources"); // 프로젝트내 resource 폴더의 실제경로
				String root = path + "\\uploadFiles" ; // 저장할 위치
				
				File file = new File(root); //경로생성용 파일 생성
				
				// 만약 uploadFiles 폴더가 없으면 생성해라 라는뜻
				if(!file.exists()) file.mkdirs();
				
				// 업로드할 폴더 설정
				String originFileName = vo.getPARTY_TUMB().getOriginalFilename(); // 원래 파일이름
				String ext = originFileName.substring(originFileName.lastIndexOf(".")); 
				String ranFileName = UUID.randomUUID().toString() + ext; //랜덤변수가 붙은 파일이름
				
				File changeFile = new File(root + "\\" + ranFileName); //파일생성 
				
				
				// 파일업로드
				try {
					vo.getPARTY_TUMB().transferTo(changeFile); //파일 업로드
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				
				
				return "/wirteParty.do";
			}
			
			//VO 필드변경
			String oldName =root + "\\" + ranFileName;	 //변경전 이름
			String changeName=oldName.replaceAll("\\\\", "\\\\\\\\"); //DB와 string에서 \를 인식 못하기 때문에 \\로 바꿔줘야함, \\를 인식하기 위해선 \\\\를 적어야함
			vo.setPARTY_TUMB_PATH(changeName); //VO갱신
			}
			
			
			vo2.setUSER_ID(userVO.getUser_Id());
			
			
			partyService.insertParty(vo); //DB 갱신
			PartyVO getVO =partyService.getNewParty(vo);
			vo2.setPARTY_ID(getVO.getPARTY_ID());
			
			memberListService.joinParty(vo2);
			
			return "index.jsp";
		}else {
			return "login.do";
		}
	}
	@RequestMapping("/getParty.do")
	public String getParty(PartyVO vo,Model model,MemberListVO vo2,HttpSession session){
		PartyVO getVO =partyService.getParty(vo);
		UserVO userVO=(UserVO)session.getAttribute("user");
		session.setAttribute("user", userVO); 
		if(getVO==null){
			return "error.jsp";
			}
		else{
		model.addAttribute("mbtiList", memberListService.getMbtiList(vo2));
		model.addAttribute("getGenderCount",memberListService.getGenderCount(vo2));
		model.addAttribute("party",getVO);
		List<MemberListVO> list=memberListService.getJoinMemberList(vo2);
		model.addAttribute("memberList", list);
		model.addAttribute("rate", partyService.getRate(getVO));

		List<String> idList =new ArrayList<>();
		for(MemberListVO v:list){
			idList.add(v.getUSER_ID());
		}
		System.out.println(idList.toString());
		model.addAttribute("idList",idList);
		

		List<MemberListVO> list2=memberListService.getFavList(vo2);
		List<String> favList =new ArrayList<>();
		for(MemberListVO v:list2){
			favList.add(v.getUSER_ID());
		}
		System.out.println(favList.toString());
		model.addAttribute("favList", favList);
		
		return "intro.jsp";
		}
		
	}
	@RequestMapping("/deleteParty.do")
	public String deleteParty(PartyVO vo,Model model){
		System.out.println(vo.getPARTY_ID());
		partyService.deleteParty(vo);
		return "index.jsp";
	}
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
                                                                                                                                                                                                