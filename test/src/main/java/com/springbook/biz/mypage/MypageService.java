package com.springbook.biz.mypage;

import com.springbook.biz.user.UserVO;

public interface MypageService {
	//회원 정보 받아오기
	public UserVO getUserInfo(UserVO vo);
	
	//회원 정보 업데이트하기
	public void updateUserInfo(UserVO vo);

}
