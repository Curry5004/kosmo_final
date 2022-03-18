package com.springbook.biz.main.controller;



import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.springbook.biz.main.CategoryVO;
import com.springbook.biz.main.MainService;
import com.springbook.biz.main.MbtiVO;
import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;
import com.springbook.biz.util.naver.NaverLoginBO;

@Controller
public class MainController {
	@Autowired
	MainService mainService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private NaverLoginBO naverLoginBO;

	@RequestMapping("/writeParty.do")
	public String writeParty(MbtiVO vo,CategoryVO vo2,Model model){ 
		model.addAttribute("MbtiList",mainService.getMbtiList(vo)); //MbtiList model 추가	
		model.addAttribute("CategoryList",mainService.getCategoryList(vo2)); //카테고리리스트  model 추가
		return "writeParty.jsp";
	}
	@RequestMapping(value="/registry_form.do", method=RequestMethod.GET)
	public String registryForm(MbtiVO vo,Model model){
//		System.out.println("로그인 페이지 진입 완료");
		model.addAttribute("MbtiList",mainService.getMbtiList(vo)); //MbtiList model 추가
		return "registryPage.jsp";
	}
	
	@RequestMapping("home.do")
	public String homePage(Model model,HttpSession session, ModelMap model2 ,@RequestParam String code, @RequestParam String state, UserVO vo)throws IOException, ParseException {
	
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result", apiResult);
		
		
//		naver 정보 vo에 저장하고 session user 에 담기 
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParser.parse(apiResult);
		System.out.println(jsonObj);
		JSONObject response = (JSONObject) jsonObj.get("response"); 
		String phone_Num = (String) response.get("mobile"); 
		String user_Id = (String) response.get("id"); 
		String name = (String) response.get("name"); 
		String birthDay = (String) response.get("birthday");
		String birthyear = (String) response.get("birthyear"); 
		vo.setPhone_Num(phone_Num);
		vo.setUser_Id(user_Id);
		vo.setBirthDay(birthyear + "-" + birthDay);
		vo.setName(name);
		session.setAttribute("user", vo); 

		int result = userService.idCheck(vo);
		System.out.println("result값" + result);   	
		if (result == 0) {
			return "registry_form.do";
	
		}
			//userService.insertUser(vo);
		
		
		UserVO userVO=(UserVO)session.getAttribute("user");
		if(userVO!=null){
			Map<String,Object> map=new HashMap<>();
			map.put("mbti_id", userVO.getMbti_Id());
			model.addAttribute("bestList", mainService.searchBestParty(map));
		}else { 
			
		}
		return "home.jsp";
		
	}
}
