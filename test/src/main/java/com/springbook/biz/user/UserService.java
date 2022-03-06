package com.springbook.biz.user;


public interface UserService {
	//회원가입
	public void insertUser(UserVO vo);
	//아이디 중복 체크
	public int idCheck(UserVO vo);
}
