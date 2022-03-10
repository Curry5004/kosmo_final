package com.springbook.biz.mypage.comtroller;



import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

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
	public String updateUserInfo(UserVO vo,Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
		UserVO vo2 = (UserVO) session.getAttribute("user");
		if (vo.getMbti_root().getSize() != 0) {
			System.out.println("mbti 사진 업로드 시작");
			// 저장할 경로 가져오기
			String path = request.getSession().getServletContext().getRealPath("resources"); // 프로젝트내																						// 실제경로
			String root = path + "\\uploadFiles"; // 저장할 위치

			File file = new File(root); // 경로생성용 파일 생성

			// 만약 uploadFiles 폴더가 없으면 생성해라 라는뜻
			if (!file.exists())
				file.mkdirs();

			// 업로드할 폴더 설정
			String originFileName = vo.getMbti_root().getOriginalFilename(); // 원래
																				// 파일이름
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String ranFileName = UUID.randomUUID().toString() + ext; // 랜덤변수가
																		// 붙은
																		// 파일이름

			File changeFile = new File(root + "\\" + ranFileName); // 파일생성

			// 파일업로드
			try {
				vo.getMbti_root().transferTo(changeFile); // 파일 업로드
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();

				System.out.println("mbti 이미지 에러 ");
				return "index.jsp";
			}

			// VO 필드변경
			String oldName = root + "\\" + ranFileName; // 변경전 이름
			String changeName = oldName.replaceAll("\\\\", "\\\\\\\\"); 
			
			vo.setMbti_Path(changeName); // VO갱신
			System.out.println("mbti 이미지 삽입완료 ");
		} else{
			vo.setMbti_Path(vo2.getMbti_Path());
		}

		if (vo.getProfile_root().getSize() != 0) {

			// 저장할 경로 가져오기
			String path = request.getSession().getServletContext().getRealPath("resources"); // 프로젝트내
																								// resource
																								// 폴더의
																								// 실제경로
			String root = path + "\\uploadFiles"; // 저장할 위치

			File file = new File(root); // 경로생성용 파일 생성

			// 만약 uploadFiles 폴더가 없으면 생성해라 라는뜻
			if (!file.exists())
				file.mkdirs();

			// 업로드할 폴더 설정
			String originFileName = vo.getProfile_root().getOriginalFilename(); // 원래
																				// 파일이름
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String ranFileName = UUID.randomUUID().toString() + ext; // 랜덤변수가
																		// 붙은
																		// 파일이름

			File changeFile = new File(root + "\\" + ranFileName); // 파일생성

			// 파일업로드
			try {
				vo.getProfile_root().transferTo(changeFile); // 파일 업로드
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();

				// System.out.println("프로필 이미지 에러 ");
				return "index.jsp";
			}

			// VO 필드변경
			String oldName = root + "\\" + ranFileName; // 변경전 이름
			String changeName = oldName.replaceAll("\\\\", "\\\\\\\\");
			vo.setProfile_Image(changeName); // VO갱신
			// System.out.println("프로필 이미지 갱신완료");
		}  else{
			vo.setProfile_Image(vo2.getProfile_Image());
		}
		System.out.println("파일 검사 완료.");
		System.out.println(vo.toString());
		mypageService.updateUserInfo(vo);
		System.out.println(vo.toString());
		System.out.println("업데이트 완료");
		return "userInfoUpdateComplete.jsp";

	}
}
