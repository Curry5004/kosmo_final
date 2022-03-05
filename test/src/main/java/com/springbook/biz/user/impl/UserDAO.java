package com.springbook.biz.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.user.UserVO;

@Repository("userDAO")
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertUser(UserVO vo) {
		System.out.println("Mybatis insert ()");
		mybatis.insert("UserDAO.insertUser", vo);
		mybatis.insert("UserDAO.insertRegList", vo);
	}
	//아이디 중복 체크
	public int idCheck(UserVO vo){
		System.out.println("Mybatis idCheck");
		int result = mybatis.selectOne("UserDAO.idCheck", vo);
		return result;
	}

}
