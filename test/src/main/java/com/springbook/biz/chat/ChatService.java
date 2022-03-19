package com.springbook.biz.chat;

import java.util.List;

public interface ChatService {

	public void insertChat(ChatVO vo);
	
	public List<ChatVO> getChatList(ChatVO vo);
}