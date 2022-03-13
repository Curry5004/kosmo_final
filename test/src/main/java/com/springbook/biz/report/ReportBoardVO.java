package com.springbook.biz.report;

import java.sql.Date;

public class ReportBoardVO {
	private int REP_BOA_ID;
	private String REP_CATEGORY_NAME;
	private String REP_TITLE;
	private String REP_BOA_WRITER;
	private String REP_BOA_CONTENT;
	private String REP_BOA_IMG_PATH;
	private String COMMENT_YN;

	
	
	
	
	public int getREP_BOA_ID() {
		return REP_BOA_ID;
	}
	public void setREP_BOA_ID(Integer rEP_BOA_ID) {
		REP_BOA_ID = rEP_BOA_ID;
	}
	public String getREP_CATEGORY_NAME() {
		return REP_CATEGORY_NAME;
	}
	public void setREP_CATEGORY_NAME(String rEP_CATEGORY_NAME) {
		REP_CATEGORY_NAME = rEP_CATEGORY_NAME;
	}
	public String getREP_TITLE() {
		return REP_TITLE;
	}
	public void setREP_TITLE(String rEP_TITLE) {
		REP_TITLE = rEP_TITLE;
	}
	public String getREP_BOA_WRITER() {
		return REP_BOA_WRITER;
	}
	public void setREP_BOA_WRITER(String rEP_BOA_WRITER) {
		REP_BOA_WRITER = rEP_BOA_WRITER;
	}
	public String getREP_BOA_CONTENT() {
		return REP_BOA_CONTENT;
	}
	public void setREP_BOA_CONTENT(String rEP_BOA_CONTENT) {
		REP_BOA_CONTENT = rEP_BOA_CONTENT;
	}
	public String getREP_BOA_IMG_PATH() {
		return REP_BOA_IMG_PATH;
	}
	public void setREP_BOA_IMG_PATH(String rEP_BOA_IMG_PATH) {
		REP_BOA_IMG_PATH = rEP_BOA_IMG_PATH;
	}
	public Date getREP_REG_DATE() {
		return REP_REG_DATE;
	}
	public void setREP_REG_DATE(Date rEP_REG_DATE) {
		REP_REG_DATE = rEP_REG_DATE;
	}
	public String getCOMMENT_YN() {
		return COMMENT_YN;
	}
	public void setCOMMENT_YN(String cOMMENT_YN) {
		COMMENT_YN = cOMMENT_YN;
	}
	private Date REP_REG_DATE;

}
