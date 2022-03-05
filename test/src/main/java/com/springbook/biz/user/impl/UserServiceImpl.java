package com.springbook.biz.user.impl;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}
	
	// 회원 로그인 체크
	@Override
	public boolean loginCheck(UserVO vo, HttpSession session) {
		boolean result = UserDAO.loginCheck(vo);
		if (result) { //true일 경우 세션에 등록
			UserVO vo2 = viewUser(vo);
		
		// 세션 변수 등록
		session.setAttribute("userId", vo2.getUserId());
		session.setAttribute("userName", vo2.getUserName());
		}
		return result;
	}
	
	// 회원 로그인 정보
	@Override
	public UserVO viewUser(UserVO vo) {
		return UserDAO.viewUser(vo);
	}
	
	// 회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		// 세션 변수 개별 삭제
		// session.removeAttribute("userId");
		// 세션 정보를 초기화 시킴
		session.invalidate();
	}
}
