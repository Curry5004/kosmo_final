package com.springbook.biz.main;

public class MbtiVO {
	private int MBTI_ID;
	private String MBTI_IMG_PATH;
	private String MBTI_NAME;
	private int CNT;
	
	public int getMBTI_ID() {
		return MBTI_ID;
	}
	public void setMBTI_ID(int mBTI_ID) {
		MBTI_ID = mBTI_ID;
	}
	public int getCNT() {
		return CNT;
	}
	public void setCNT(int cNT) {
		CNT = cNT;
	}
	public String getMBTI_IMG_PATH() {
		return MBTI_IMG_PATH;
	}
	public void setMBTI_IMG_PATH(String mBTI_IMG_PATH) {
		MBTI_IMG_PATH = mBTI_IMG_PATH;
	}
	public String getMBTI_NAME() {
		return MBTI_NAME;
	}
	public void setMBTI_NAME(String mBTI_NAME) {
		MBTI_NAME = mBTI_NAME;
	}
	@Override
	public String toString() {
		return "MbtiVO [MBTI_ID=" + MBTI_ID + ", MBTI_IMG_PATH=" + MBTI_IMG_PATH + ", MBTI_NAME=" + MBTI_NAME + ", CNT="
				+ CNT + "]";
	}
}
