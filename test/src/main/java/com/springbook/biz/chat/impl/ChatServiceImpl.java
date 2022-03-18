package com.springbook.biz.chat.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.chat.ChatService;
import com.springbook.biz.chat.ChatVO;

@Service("chatService")
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	ChatDAO chatDAO;

	@Override
	public void insertChat(ChatVO vo) {
		chatDAO.insertChat(vo);
	}
	
	public List<ChatVO> getChatList (ChatVO vo){
		return chatDAO.getChatList(vo);
	}
}