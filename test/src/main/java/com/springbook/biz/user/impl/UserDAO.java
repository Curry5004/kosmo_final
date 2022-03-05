package com.springbook.biz.user.impl;

import javax.servlet.http.HttpSession;

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
	
	public String getUser_Id(UserVO vo) {
		System.out.println("로그인 시도");
		mybatis.
	}
}

