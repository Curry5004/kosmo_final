package com.springbook.biz.albumComment;

import java.util.Date;

public class AlbumCommentVO {
	private int alb_comment_id;
	private int party_id;
	private int alb_id;
	private String user_id;
	private String user_name;
	private String alb_comment_content;
	private Date alb_comment_reg_date;
	private Date alb_comment_mod_date;
	public int getAlb_comment_id() {
		return alb_comment_id;
	}
	public void setAlb_comment_id(int alb_comment_id) {
		this.alb_comment_id = alb_comment_id;
	}
	public int getParty_id() {
		return party_id;
	}
	public void setParty_id(int party_id) {
		this.party_id = party_id;
	}
	public int getAlb_id() {
		return alb_id;
	}
	public void setAlb_id(int alb_id) {
		this.alb_id = alb_id;
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
	public String getAlb_comment_content() {
		return alb_comment_content;
	}
	public void setAlb_comment_content(String alb_comment_content) {
		this.alb_comment_content = alb_comment_content;
	}
	public Date getAlb_comment_reg_date() {
		return alb_comment_reg_date;
	}
	public void setAlb_comment_reg_date(Date alb_comment_reg_date) {
		this.alb_comment_reg_date = alb_comment_reg_date;
	}
	public Date getAlb_comment_mod_date() {
		return alb_comment_mod_date;
	}
	public void setAlb_comment_mod_date(Date alb_comment_mod_date) {
		this.alb_comment_mod_date = alb_comment_mod_date;
	}
	@Override
	public String toString() {
		return "AlbumCommentVO [alb_comment_id=" + alb_comment_id + ", party_id=" + party_id + ", alb_id=" + alb_id
				+ ", user_id=" + user_id + ", user_name=" + user_name + ", alb_comment_content=" + alb_comment_content
				+ ", alb_comment_reg_date=" + alb_comment_reg_date + ", alb_comment_mod_date=" + alb_comment_mod_date
				+ "]";
	}
	

}
