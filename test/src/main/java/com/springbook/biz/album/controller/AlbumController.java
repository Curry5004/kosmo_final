package com.springbook.biz.album.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.album.AlbumService;
import com.springbook.biz.album.AlbumVO;
import com.springbook.biz.albumComment.AlbumCommentService;
import com.springbook.biz.albumComment.AlbumCommentVO;
import com.springbook.biz.board.PageVO;
import com.springbook.biz.user.UserVO;

@Controller
public class AlbumController {
	@Autowired
	AlbumService albumService;
	
	@Autowired
	AlbumCommentService albumcommentService;
	
	@RequestMapping("insertAlbum.do")
	public String insertAlbum(AlbumVO vo,Model model,HttpServletRequest request){
		//user id 넣는 객체가 없어서 그런지 계속 뻑남. 그래서 추가함.
		HttpSession session = request.getSession();
		UserVO vo2 = (UserVO) session.getAttribute("user");
		vo.setUser_id(vo2.getUser_Id());
		// 여기까지.
			if(vo.getAlb_img().getSize()!=0){
			
			
			// 저장할 경로 가져오기
			String path = request.getSession().getServletContext().getRealPath("resources"); // 프로젝트내 resource 폴더의 실제경로
			String root = path + "\\uploadFiles" ; // 저장할 위치
			
			File file = new File(root); //경로생성용 파일 생성
			
			// 만약 uploadFiles 폴더가 없으면 생성해라 라는뜻
			if(!file.exists()) file.mkdirs();
			
			// 업로드할 폴더 설정
			String originFileName = vo.getAlb_img().getOriginalFilename(); // 원래 파일이름
			String ext = originFileName.substring(originFileName.lastIndexOf(".")); 
			String ranFileName = UUID.randomUUID().toString() + ext; //랜덤변수가 붙은 파일이름
			
			File changeFile = new File(root + "\\" + ranFileName); //파일생성 
			
			
			// 파일업로드
			try {
				vo.getAlb_img().transferTo(changeFile); //파일 업로드
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			
			
			return "/insertAlbum.do";
			}
		
		//VO 필드변경
		String oldName =root + "\\" + ranFileName;	 //변경전 이름
		String changeName=oldName.replaceAll("\\\\", "\\\\\\\\"); //DB와 string에서 \를 인식 못하기 때문에 \\로 바꿔줘야함, \\를 인식하기 위해선 \\\\를 적어야함
		vo.setAlb_img_path(changeName); //VO갱신
		}
		vo.setAlb_writer("admin02");
		albumService.insertAlbum(vo);
		return "index.jsp";
	}
	
	@RequestMapping(value="/getAlbumList.do")
	public String getAlbumList(AlbumVO vo, Model model, PageVO page) {
		 //vo.getPartId();
		int count = albumService.getAlbumCnt(vo);
		String pageNo = page.getPageNo();
		System.out.println(pageNo);
		int currentPage = 1;
		int listSize = 10;
		int pageSize = 5;
		if(pageNo != null) {
			currentPage = Integer.parseInt(pageNo);
		}
		int startRow = (currentPage-1) * listSize;
		
		vo.setStartRow(startRow);
		vo.setListSize(listSize);
		System.out.println("시작번호"+startRow);
		
		
		PageVO pages = new PageVO(count, currentPage, listSize, pageSize);
		System.out.println(pages.getTotal());
		System.out.println(count);
		 
		List<AlbumVO> getList =albumService.getAlbumList(vo);
		System.out.println(getList.toString());
		model.addAttribute("albumList", getList);
		model.addAttribute("pages", pages);
		return "albumList.jsp";
	}
	
	@RequestMapping("getAlbum.do")
	public String getAlbum(AlbumVO vo,AlbumCommentVO vo2,Model model,HttpSession session){
		UserVO userVO=new UserVO();
		userVO.setUser_Id("ADMIN10");
		session.setAttribute("user", userVO);
		model.addAttribute("album", albumService.getAlbum(vo));
		Map<String, AlbumVO> likeList=new HashMap<String, AlbumVO>();
		
		for(AlbumVO albumVO:albumService.getLikeList(vo)){
			likeList.put(albumVO.getUser_id(), albumVO);
		}
		System.out.println("맵 테스트 :"+likeList);
		model.addAttribute("likeList", likeList);
		System.out.println("앨범좋아요 리스트 : " +albumService.getLikeList(vo).toString());
		
		model.addAttribute("commentList", albumcommentService.getAlbumCommentList(vo2));
		System.out.println("댓글리스트 : "+albumcommentService.getAlbumCommentList(vo2));
		
		return "readAlbum.jsp";
	}
	
	@RequestMapping("likeUp.do")
	public String likeUp(AlbumVO vo,Model model,HttpSession session){
		
		UserVO userVO=(UserVO)session.getAttribute("user");
		vo.setUser_id(userVO.getUser_Id());
		albumService.likeUp(vo);
		return "getAlbum.do?alb_id="+vo.getAlb_id();
	}
	@RequestMapping("likeDown.do")
	public String likeDown(AlbumVO vo,Model model,HttpSession session){
		
		UserVO userVO=(UserVO)session.getAttribute("user");
		vo.setUser_id(userVO.getUser_Id());
		albumService.likeDown(vo);
		return "getAlbum.do?alb_id="+vo.getAlb_id();
	}
	
	@RequestMapping("writeAlbumComment.do")
	public String writeAlbumComment(AlbumCommentVO vo,Model model,HttpSession session){
		UserVO userVO=(UserVO)session.getAttribute("user");
		vo.setUser_id(userVO.getUser_Id());
		albumcommentService.writeAlbumComment(vo);
		return "getAlbum.do?alb_id="+vo.getAlb_id();
	}
	
	@RequestMapping("deleteAlbumComment.do")
	public String deleteAlbumComment(AlbumCommentVO vo,Model model,HttpSession session){
		UserVO userVO=(UserVO)session.getAttribute("user");
		vo.setUser_id(userVO.getUser_Id());
		albumcommentService.deleteAlbumComment(vo);
		return "getAlbum.do?alb_id="+vo.getAlb_id();
	}
	
	@RequestMapping("modifyAlbumComment.do")
	public String modifyAlbumComment(AlbumCommentVO vo,Model model,HttpSession session){
		System.out.println(vo.getAlb_comment_content());
		UserVO userVO=(UserVO)session.getAttribute("user");
		vo.setUser_id(userVO.getUser_Id());
		albumcommentService.modifyAlbumComment(vo);
		return "getAlbum.do?alb_id="+vo.getAlb_id();
	}
	
}
