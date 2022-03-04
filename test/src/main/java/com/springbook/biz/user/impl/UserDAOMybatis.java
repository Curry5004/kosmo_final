package com.springbook.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.user.UserVO;

@Repository
public class UserDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<UserVO> getUserList(UserVO vo){
		System.out.println("===> Mybatis��  getUser() ��� ó��");
		return mybatis.selectList("UserDAO.getUserList", vo);
	}
}
