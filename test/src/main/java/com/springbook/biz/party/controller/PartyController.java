package com.springbook.biz.party.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.party.PartyService;
import com.springbook.biz.party.PartyVO;

@Controller
public class PartyController {
	@Autowired
	PartyService partyService;
	
	@RequestMapping("/wirteParty.do")
	public String insertParty(PartyVO vo,Model model,HttpServletRequest request){
		System.out.println(vo.getPARTY_TUMB().getSize());
		if(vo.getPARTY_TUMB().getSize()!=0){
			// 1. 전송받은 파일 및 파일설명 값 가져오기
			System.out.println("singleFile : " + vo.getPARTY_TUMB());
			
			// 2. 저장할 경로 가져오기
			String path = request.getSession().getServletContext().getRealPath("resources");
			System.out.println("path : " + path);
			String root = path + "\\uploadFiles" ;
			
			File file = new File(root);
			
			// 만약 uploadFiles 폴더가 없으면 생성해라 라는뜻
			if(!file.exists()) file.mkdirs();
			
			// 업로드할 폴더 설정
			String originFileName = vo.getPARTY_TUMB().getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String ranFileName = UUID.randomUUID().toString() + ext;
			
			File changeFile = new File(root + "\\" + ranFileName);
			
			// 파일업로드
			try {
				vo.getPARTY_TUMB().transferTo(changeFile);
				System.out.println("파일 업로드 성공");
			} catch (IllegalStateException | IOException e) {
				System.out.println("파일 업로드 실패");
				e.printStackTrace();
			
			
			return "/wirteParty.do";
			}
		
			
		String oldName =root + "\\" + ranFileName;
		String changeName=oldName.replaceAll("\\\\", "\\\\\\\\");
		System.out.println(changeName);
	
		vo.setPARTY_TUMB_PATH(changeName);
		}
		
		partyService.insertParty(vo);
		
		return "index.jsp";
				
	}

}
