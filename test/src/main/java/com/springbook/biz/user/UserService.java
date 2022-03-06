package com.springbook.biz.user;

import javax.servlet.http.HttpSession;

public interface UserService {
	//회원가입
	public void insertUser(UserVO vo);
	//아이디 중복 체크
	public int idCheck(UserVO vo);
	
	// 회원 로그인 체크
	public boolean loginCheck(UserVO vo, HttpSession session);
	
	// 회원 로그인 정보
	public UserVO viewUser(UserVO vo);
	
	// 회원 로그아웃
	public void logout(HttpSession session);
}
