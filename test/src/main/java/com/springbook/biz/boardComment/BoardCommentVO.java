package com.springbook.biz.boardComment;

import java.util.Date;

public class BoardCommentVO {
	private int art_comment_id;
	private int party_id;
	private int art_id;
	private String art_comment_writer;
	private String art_comment_user_name;
	private String art_comment_content;
	private Date art_comment_reg_date;
	private Date art_comment_mod_date;
	
	
	@Override
	public String toString() {
		return "BoardCommentVO [art_comment_id=" + art_comment_id + ", party_id=" + party_id + ", art_id=" + art_id
				+ ", art_comment_writer=" + art_comment_writer + ", art_comment_user_name=" + art_comment_user_name
				+ ", art_comment_content=" + art_comment_content + ", art_comment_reg_date=" + art_comment_reg_date
				+ ", art_comment_mod_date=" + art_comment_mod_date + "]";
	}
	public int getArt_comment_id() {
		return art_comment_id;
	}
	public void setArt_comment_id(int art_comment_id) {
		this.art_comment_id = art_comment_id;
	}
	public int getParty_id() {
		return party_id;
	}
	public void setParty_id(int party_id) {
		this.party_id = party_id;
	}
	public int getArt_id() {
		return art_id;
	}
	public void setArt_id(int art_id) {
		this.art_id = art_id;
	}
	public String getArt_comment_writer() {
		return art_comment_writer;
	}
	public void setArt_comment_writer(String art_comment_writer) {
		this.art_comment_writer = art_comment_writer;
	}
	public String getArt_comment_content() {
		return art_comment_content;
	}
	public void setArt_comment_content(String art_comment_content) {
		this.art_comment_content = art_comment_content;
	}
	public Date getArt_comment_reg_date() {
		return art_comment_reg_date;
	}
	public void setArt_comment_reg_date(Date art_comment_reg_date) {
		this.art_comment_reg_date = art_comment_reg_date;
	}
	public Date getArt_comment_mod_date() {
		return art_comment_mod_date;
	}
	public void setArt_comment_mod_date(Date art_comment_mod_date) {
		this.art_comment_mod_date = art_comment_mod_date;
	}
	public String getArt_comment_user_name() {
		return art_comment_user_name;
	}
	public void setArt_comment_user_name(String art_comment_user_name) {
		this.art_comment_user_name = art_comment_user_name;
	}
	
}
