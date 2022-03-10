package com.springbook.biz.party;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class PartyVO {
	private int PARTY_ID;
	private String PARTY_TITLE;
	private String PARTY_CREATOR;
	private String PARTY_PRE_MBTI1;
	private String PARTY_PRE_MBTI2;
	private String PARTY_PRE_MBTI3;
	private String PARTY_PRE_MBTI4;
	private String CATEGORY_NAME;
	private String PARTY_INTRODUCE;
	private String PARTY_LOCATION;
	private MultipartFile PARTY_TUMB;
	private String PARTY_TUMB_PATH;
	private int PARTY_MAXIMUM;
	private double PARTY_RATE1;
	private double PARTY_RATE2;
	private double PARTY_RATE3;
	private Date PARTY_REG_DATE;
	private boolean PARTY_AVAILABLE;
	private String SEARCH_KEYWORD;
	
	public int getPARTY_ID() {
		return PARTY_ID;
	}
	public void setPARTY_ID(int pARTY_ID) {
		PARTY_ID = pARTY_ID;
	}
	public String getPARTY_TITLE() {
		return PARTY_TITLE;
	}
	public void setPARTY_TITLE(String pARTY_TITLE) {
		PARTY_TITLE = pARTY_TITLE;
	}
	public String getPARTY_CREATOR() {
		return PARTY_CREATOR;
	}
	public void setPARTY_CREATOR(String pARTY_CREATOR) {
		PARTY_CREATOR = pARTY_CREATOR;
	}
	public String getPARTY_PRE_MBTI1() {
		return PARTY_PRE_MBTI1;
	}
	public void setPARTY_PRE_MBTI1(String pARTY_PRE_MBTI1) {
		PARTY_PRE_MBTI1 = pARTY_PRE_MBTI1;
	}
	public String getPARTY_PRE_MBTI2() {
		return PARTY_PRE_MBTI2;
	}
	public void setPARTY_PRE_MBTI2(String pARTY_PRE_MBTI2) {
		PARTY_PRE_MBTI2 = pARTY_PRE_MBTI2;
	}
	public String getPARTY_PRE_MBTI3() {
		return PARTY_PRE_MBTI3;
	}
	public void setPARTY_PRE_MBTI3(String pARTY_PRE_MBTI3) {
		PARTY_PRE_MBTI3 = pARTY_PRE_MBTI3;
	}
	public String getPARTY_PRE_MBTI4() {
		return PARTY_PRE_MBTI4;
	}
	public void setPARTY_PRE_MBTI4(String pARTY_PRE_MBTI4) {
		PARTY_PRE_MBTI4 = pARTY_PRE_MBTI4;
	}
	public String getCATEGORY_NAME() {
		return CATEGORY_NAME;
	}
	public void setCATEGORY_NAME(String cATEGORY_NAME) {
		CATEGORY_NAME = cATEGORY_NAME;
	}
	public String getPARTY_INTRODUCE() {
		return PARTY_INTRODUCE;
	}
	public void setPARTY_INTRODUCE(String pARTY_INTRODUCE) {
		PARTY_INTRODUCE = pARTY_INTRODUCE;
	}
	public String getPARTY_LOCATION() {
		return PARTY_LOCATION;
	}
	public void setPARTY_LOCATION(String pARTY_LOCATION) {
		PARTY_LOCATION = pARTY_LOCATION;
	}
	public MultipartFile getPARTY_TUMB() {
		return PARTY_TUMB;
	}
	public void setPARTY_TUMB(MultipartFile pARTY_TUMB) {
		PARTY_TUMB = pARTY_TUMB;
	}
	public String getPARTY_TUMB_PATH() {
		return PARTY_TUMB_PATH;
	}
	public void setPARTY_TUMB_PATH(String pARTY_TUMB_PATH) {
		PARTY_TUMB_PATH = pARTY_TUMB_PATH;
	}
	public int getPARTY_MAXIMUM() {
		return PARTY_MAXIMUM;
	}
	public void setPARTY_MAXIMUM(int pARTY_MAXIMUM) {
		PARTY_MAXIMUM = pARTY_MAXIMUM;
	}
	public double getPARTY_RATE1() {
		return PARTY_RATE1;
	}
	public void setPARTY_RATE1(double pARTY_RATE1) {
		PARTY_RATE1 = pARTY_RATE1;
	}
	public double getPARTY_RATE2() {
		return PARTY_RATE2;
	}
	public void setPARTY_RATE2(double pARTY_RATE2) {
		PARTY_RATE2 = pARTY_RATE2;
	}
	public double getPARTY_RATE3() {
		return PARTY_RATE3;
	}
	public void setPARTY_RATE3(double pARTY_RATE3) {
		PARTY_RATE3 = pARTY_RATE3;
	}
	public Date getPARTY_REG_DATE() {
		return PARTY_REG_DATE;
	}
	public void setPARTY_REG_DATE(Date pARTY_REG_DATE) {
		PARTY_REG_DATE = pARTY_REG_DATE;
	}
	public boolean isPARTY_AVAILABLE() {
		return PARTY_AVAILABLE;
	}
	public void setPARTY_AVAILABLE(boolean pARTY_AVAILABLE) {
		PARTY_AVAILABLE = pARTY_AVAILABLE;
	}
	
	public String getSEARCH_KEYWORD() {
		return SEARCH_KEYWORD;
	}
	public void setSEARCH_KEYWORD(String sEARCH_KEYWORD) {
		SEARCH_KEYWORD = sEARCH_KEYWORD;
	}
	@Override
	public String toString() {
		return "PartyVO [PARTY_ID=" + PARTY_ID + ", PARTY_TITLE=" + PARTY_TITLE + ", PARTY_CREATOR=" + PARTY_CREATOR
				+ ", PARTY_PRE_MBTI1=" + PARTY_PRE_MBTI1 + ", PARTY_PRE_MBTI2=" + PARTY_PRE_MBTI2 + ", PARTY_PRE_MBTI3="
				+ PARTY_PRE_MBTI3 + ", PARTY_PRE_MBTI4=" + PARTY_PRE_MBTI4 + ", CATEGORY_NAME=" + CATEGORY_NAME
				+ ", PARTY_INTRODUCE=" + PARTY_INTRODUCE + ", PARTY_LOCATION=" + PARTY_LOCATION + ", PARTY_TUMB="
				+ PARTY_TUMB + ", PARTY_TUMB_PATH=" + PARTY_TUMB_PATH + ", PARTY_MAXIMUM=" + PARTY_MAXIMUM
				+ ", PARTY_RATE1=" + PARTY_RATE1 + ", PARTY_RATE2=" + PARTY_RATE2 + ", PARTY_RATE3=" + PARTY_RATE3
				+ ", PARTY_REG_DATE=" + PARTY_REG_DATE + ", PARTY_AVAILABLE=" + PARTY_AVAILABLE + "]";
	}
	
	
	
	
	
}
