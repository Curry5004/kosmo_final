package com.springbook.biz.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.PageVO;
import com.springbook.biz.user.UserVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/getBoardList.do", method=RequestMethod.GET)
	public String getBoardList(BoardVO vo, Model model, PageVO page) {
		
		
		 //vo.getPartyId();
		int party_id=vo.getParty_id();
		int count = boardService.getBoardCnt(vo);
		String pageNo = page.getPageNo();
		System.out.println(pageNo);
		int currentPage = 1;
		int listSize = 4;
		int pageSize = 5;
		if(pageNo != null) {
			currentPage = Integer.parseInt(pageNo);
		}
		int startRow = (currentPage-1) * listSize;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("party_id", party_id);
		map.put("startRow", startRow);
		map.put("listSize", listSize);
		
		
		PageVO pages = new PageVO(count, currentPage, listSize, pageSize);
		System.out.println(pages.getTotal());
		System.out.println(count);
		
		
		model.addAttribute("boardList", boardService.getBoardList(map));
		model.addAttribute("pages", pages);
		model.addAttribute("party_id", party_id);
		return "boardList.jsp";
		
	}
	@RequestMapping(value="/insertBoard.do")
	public String insertBoard(BoardVO vo, Model model, HttpServletRequest request) {
			UserVO userVO=(UserVO)request.getSession().getAttribute("user");
			if(userVO!=null){
				if(vo.getArt_img().getSize()!=0){
				
				
				// 저장할 경로 가져오기
				String path = request.getSession().getServletContext().getRealPath("resources"); // 프로젝트내 resource 폴더의 실제경로
				String root = path + "\\uploadFiles" ; // 저장할 위치
				
				File file = new File(root); //경로생성용 파일 생성
				
				// 만약 uploadFiles 폴더가 없으면 생성해라 라는뜻
				if(!file.exists()) file.mkdirs();
				
				// 업로드할 폴더 설정
				String originFileName = vo.getArt_img().getOriginalFilename(); // 원래 파일이름
				String ext = originFileName.substring(originFileName.lastIndexOf(".")); 
				String ranFileName = UUID.randomUUID().toString() + ext; //랜덤변수가 붙은 파일이름
				
				File changeFile = new File(root + "\\" + ranFileName); //파일생성 
				
				
				// 파일업로드
				try {
					vo.getArt_img().transferTo(changeFile); //파일 업로드
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				
				
				return "/insertBoard.do";
				}
		
			//VO 필드변경
				String oldName =root + "\\" + ranFileName;	 //변경전 이름
				String changeName=oldName.replaceAll("\\\\", "\\\\\\\\"); //DB와 string에서 \를 인식 못하기 때문에 \\로 바꿔줘야함, \\를 인식하기 위해선 \\\\를 적어야함
				vo.setArt_img_path(changeName); //VO갱신
				}
				vo.setArt_writer(userVO.getUser_Id());
				System.out.println(userVO.getUser_Id());
				boardService.insertBoard(vo);
				return "index.jsp";
			}else{
				return "login.do";}
			}
}
