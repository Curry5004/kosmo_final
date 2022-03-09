package com.springbook.biz.admin;

import java.util.Date;

public class AdminVO {
	private String user_id;
	private boolean request;
	private String name;
	private Date join_date;
	private int mbti_id;
	private String mbti_path;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public boolean isRequest() {
		return request;
	}
	public void setRequest(boolean request) {
		this.request = request;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public int getMbti_id() {
		return mbti_id;
	}
	public void setMbti_id(int mbti_id) {
		this.mbti_id = mbti_id;
	}
	public String getMbti_path() {
		return mbti_path;
	}
	public void setMbti_path(String mbti_path) {
		this.mbti_path = mbti_path;
	}
	@Override
	public String toString() {
		return "AdminVO [user_id=" + user_id + ", request=" + request + ", name=" + name + ", join_date=" + join_date
				+ ", mbti_id=" + mbti_id + ", mbti_path=" + mbti_path + "]";
	}
}
