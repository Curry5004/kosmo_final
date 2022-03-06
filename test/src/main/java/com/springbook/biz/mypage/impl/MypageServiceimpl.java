package com.springbook.biz.mypage.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.springbook.biz.mypage.MypageService;
import com.springbook.biz.user.UserVO;

@Service("mypageService")
public class MypageServiceimpl implements MypageService{
	@Autowired
	private MypageDAO mypageDAO;
	
	public UserVO getUserInfo(UserVO vo){
		return mypageDAO.getUserInfo(vo);
	}

}
