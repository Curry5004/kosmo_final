package com.springbook.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

//	public List<UserVO_serverTest> getUserList(UserVO_serverTest vo) {
//		return userDAO.getUserList(vo);
//	}

	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}
}
