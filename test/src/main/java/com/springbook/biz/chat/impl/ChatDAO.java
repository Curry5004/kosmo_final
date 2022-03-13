package com.springbook.biz.chat.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.chat.ChatVO;

@Repository
public class ChatDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;

	public void insertChat(ChatVO vo){
		mybatis.insert("ChatDAO.insertChat", vo);
	}
}