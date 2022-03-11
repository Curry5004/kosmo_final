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
		System.out.println("mybatis 업데이트 진입");
		mybatis.update("MypageDAO.updateUserInfo", vo);
		System.out.println("mybatis 처리 완료");
	}

}
