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
//		System.out.println("Mybatis insert ()");
		mybatis.insert("UserDAO.insertUser", vo);
		mybatis.insert("UserDAO.insertRegList", vo);
	}
	//아이디 중복 체크
	public int idCheck(UserVO vo){
//		System.out.println("Mybatis idCheck");
		int result = mybatis.selectOne("UserDAO.idCheck", vo);
		return result;
	}
	
	//전화번호 중복 체크
	public int numCheck(UserVO vo){
//		System.out.println("Mybatis idCheck");
		int result = mybatis.selectOne("UserDAO.numCheck", vo);
		return result;
	}
	// 회원 로그인체크
	public boolean loginCheck(UserVO vo) {
//		System.out.println("userDao 진입");
		String name = mybatis.selectOne("UserDAO.loginCheck", vo);
//		System.out.println(vo.toString());
		return(name == null) ? false : true;
	}
	
	// 회원 로그인 정보
	public UserVO viewUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.viewUser", vo);
	}
	// 회원 로그아웃
	public void logout(HttpSession session) {
	}


}
