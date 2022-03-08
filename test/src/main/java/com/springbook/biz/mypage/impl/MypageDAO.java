package com.springbook.biz.mypage.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.user.UserVO;

@Repository("mypageDAO")
public class MypageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserVO getUserInfo(UserVO vo){
		return mybatis.selectOne("MypageDAO.getUserInfo", vo);
	}
	
	public void updateUserInfo(UserVO vo){
		mybatis.update("MypageDAO.updateUserInfo");
	}

}
