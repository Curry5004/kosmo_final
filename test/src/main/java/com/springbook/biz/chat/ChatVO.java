package com.springbook.biz.chat;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ChatVO {
	private int party_id;
	private String user_id;
	private String user_name;
	private String content;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date reg_date;
	
	
	public int getParty_id() {
		return party_id;
	}
	public void setParty_id(int party_id) {
		this.party_id = party_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "ChatVO [party_id=" + party_id + ", user_id=" + user_id + ", user_name=" + user_name + ", content="
				+ content + ", reg_date=" + reg_date + "]";
	} 
	
	
}