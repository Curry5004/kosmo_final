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
		System.out.println("마이바티스 userInfo 진입");
		return mybatis.selectOne("MypageDAO.getUserInfo", vo);
	}

}
