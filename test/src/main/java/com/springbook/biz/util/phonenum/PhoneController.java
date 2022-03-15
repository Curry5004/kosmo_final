package com.springbook.biz.util.phonenum;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class PhoneController {
	@ResponseBody
	   @RequestMapping(value = "sendSms.do", method = RequestMethod.POST)
	     public String sendSms(HttpServletRequest request) throws Exception {

	       String api_key = "NCSF8XKO3VS60HVT";
	       String api_secret = "ZIHY8OZR0NECP6VLMCWWH18QAS0OURBF";

	       CoolSMS coolsms = new CoolSMS(api_key, api_secret);
	       
	       HashMap<String, String> set = new HashMap<String, String>();

	       set.put("to", (String)request.getParameter("to")); // 받는 사람
	       set.put("from", "01066901414"); // 발신번호
	       set.put("title", "");
	       set.put("text", "안녕하세요 인증번호는 ["+(String)request.getParameter("text")+"]입니다."); // 문자내용
	       set.put("type", "sms"); // 문자 타입

	       JSONObject result = coolsms.send(set); // 보내기&전송결과받기

	       if ((boolean)result.get("status") == true) {
	         // 메시지 보내기 성공 및 전송결과 출력
	         System.out.println("성공");
	         System.out.println("groupid=" + result.get("group_id")); // 그룹아이디
	         System.out.println("결과코드="+ result.get("result_code")); // 결과코드
	         System.out.println("결과메시지= " + result.get("result_message")); // 결과 메시지
	         System.out.println("메시지아이디="+result.get("success_count")); // 메시지아이디
	         System.out.println("오류메시지 수= " +result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	       } else {
	         // 메시지 보내기 실패
	         System.out.println("실패");
	         System.out.println("rest API 에러코드 = " + result.get("code")); // REST API 에러코드
	         System.out.println("에러메시지=" + result.get("message")); // 에러메시지
	       }
	     
	       return "registry_form.do";
	     }
}
