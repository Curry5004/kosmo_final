package com.springbook.biz.sch;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class SchVO {
	private int sch_id;
	private String user_id;
	private int party_id;
	private String sch_title;
	private String sch_writer;
	private String sch_content;
	private String location_address;
	private String location_name;
	private String location_x;
	private String location_y;
	private String sch_note;
	private int sch_member_count;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sch_date;
	private boolean sch_available;
	private String member_id;
	private int rate1;
	private int rate2;
	private int rate3;
	private String year;
	private String month;
	private String day;
	public int getSch_id() {
		return sch_id;
	}
	public void setSch_id(int sch_id) {
		this.sch_id = sch_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getParty_id() {
		return party_id;
	}
	public void setParty_id(int party_id) {
		this.party_id = party_id;
	}
	public String getSch_title() {
		return sch_title;
	}
	public void setSch_title(String sch_title) {
		this.sch_title = sch_title;
	}
	public String getSch_writer() {
		return sch_writer;
	}
	public void setSch_writer(String sch_writer) {
		this.sch_writer = sch_writer;
	}
	public String getSch_content() {
		return sch_content;
	}
	public void setSch_content(String sch_content) {
		this.sch_content = sch_content;
	}
	public String getLocation_address() {
		return location_address;
	}
	public void setLocation_address(String location_address) {
		this.location_address = location_address;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public String getLocation_x() {
		return location_x;
	}
	public void setLocation_x(String location_x) {
		this.location_x = location_x;
	}
	public String getLocation_y() {
		return location_y;
	}
	public void setLocation_y(String location_y) {
		this.location_y = location_y;
	}
	public String getSch_note() {
		return sch_note;
	}
	public void setSch_note(String sch_note) {
		this.sch_note = sch_note;
	}
	public int getSch_member_count() {
		return sch_member_count;
	}
	public void setSch_member_count(int sch_member_count) {
		this.sch_member_count = sch_member_count;
	}
	public Date getSch_date() {
		return sch_date;
	}
	public void setSch_date(Date sch_date) {
		this.sch_date = sch_date;
	}
	public boolean isSch_available() {
		return sch_available;
	}
	public void setSch_available(boolean sch_available) {
		this.sch_available = sch_available;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getRate1() {
		return rate1;
	}
	public void setRate1(int rate1) {
		this.rate1 = rate1;
	}
	public int getRate2() {
		return rate2;
	}
	public void setRate2(int rate2) {
		this.rate2 = rate2;
	}
	public int getRate3() {
		return rate3;
	}
	public void setRate3(int rate3) {
		this.rate3 = rate3;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	@Override
	public String toString() {
		return "SchVO [sch_id=" + sch_id + ", user_id=" + user_id + ", party_id=" + party_id + ", sch_title="
				+ sch_title + ", sch_writer=" + sch_writer + ", sch_content=" + sch_content + ", location_address="
				+ location_address + ", location_name=" + location_name + ", location_x=" + location_x + ", location_y="
				+ location_y + ", sch_note=" + sch_note + ", sch_member_count=" + sch_member_count + ", sch_date="
				+ sch_date + ", sch_available=" + sch_available + ", member_id=" + member_id + ", rate1=" + rate1
				+ ", rate2=" + rate2 + ", rate3=" + rate3 + ", year=" + year + ", month=" + month + ", day=" + day
				+ "]";
	}
	
	
	
	
	
}
