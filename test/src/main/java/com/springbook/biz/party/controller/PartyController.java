package com.springbook.biz.party.controller;

import java.io.File;
import java.io.IOException;
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


import com.springbook.biz.party.PartyService;
import com.springbook.biz.party.PartyVO;
import com.springbook.biz.user.UserVO;
import com.springbook.biz.party.PartyVO;
import com.springbook.biz.party.PageVO;

@Controller
public class PartyController {
	@Autowired
	PartyService partyService;
	
	//소모임 작성
	@RequestMapping("/insertParty.do")
	public String insertParty(PartyVO vo,Model model,HttpServletRequest request){
		
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
		vo.setPARTY_TUMB_PATH(oldName); //VO갱신
		}
		
		partyService.insertParty(vo); //DB 갱신
		
		return "index.jsp";
	}
	@RequestMapping("/getParty.do")
	public String getParty(PartyVO vo,Model model,HttpServletRequest request){
		PartyVO getVO =partyService.getParty(vo);
		HttpSession session=request.getSession();
		UserVO userVO=new UserVO();
		userVO.setUser_Id("로그인미구현대체");
		session.setAttribute("user", userVO);
		if(getVO==null){
			return "error.jsp";
			}
		else{
		model.addAttribute("party",getVO);
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
                                                                                                                                                                                                