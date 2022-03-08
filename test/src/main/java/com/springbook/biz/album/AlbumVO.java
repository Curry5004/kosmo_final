package com.springbook.biz.album;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class AlbumVO {
	private int alb_id;
	private int party_id;
	private String user_id;
	private String alb_writer;
	private MultipartFile alb_img;
	private String alb_img_path;
	private Date alb_reg_date;
	private boolean alb_available;
	private int likeCnt;
	private int listSize;
	private int startRow;
	public int getAlb_id() {
		return alb_id;
	}
	public void setAlb_id(int alb_id) {
		this.alb_id = alb_id;
	}
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
	public String getAlb_writer() {
		return alb_writer;
	}
	public void setAlb_writer(String alb_writer) {
		this.alb_writer = alb_writer;
	}
	public MultipartFile getAlb_img() {
		return alb_img;
	}
	public void setAlb_img(MultipartFile alb_img) {
		this.alb_img = alb_img;
	}
	public String getAlb_img_path() {
		return alb_img_path;
	}
	public void setAlb_img_path(String alb_img_path) {
		this.alb_img_path = alb_img_path;
	}
	public Date getAlb_reg_date() {
		return alb_reg_date;
	}
	public void setAlb_reg_date(Date alb_reg_date) {
		this.alb_reg_date = alb_reg_date;
	}
	public boolean isAlb_available() {
		return alb_available;
	}
	public void setAlb_available(boolean alb_available) {
		this.alb_available = alb_available;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	@Override
	public String toString() {
		return "AlbumVO [alb_id=" + alb_id + ", party_id=" + party_id + ", user_id=" + user_id + ", alb_writer="
				+ alb_writer + ", alb_img=" + alb_img + ", alb_img_path=" + alb_img_path + ", alb_reg_date="
				+ alb_reg_date + ", alb_available=" + alb_available + ", likeCnt=" + likeCnt + ", listSize=" + listSize
				+ ", startRow=" + startRow + "]";
	}
	
	
	
	
	
}
