package com.springbook.biz.memberList;

public class MemberListVO {
	private String USER_ID;
	private int PARTY_ID;
	private boolean PARTY_REQUEST;
	private String MBTI_NAME;
	private int COUNT;
	private int GENDERCOUNT;
	private String  NAME;
	
	
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public int getGENDERCOUNT() {
		return GENDERCOUNT;
	}
	public void setGENDERCOUNT(int gENDERCOUNT) {
		GENDERCOUNT = gENDERCOUNT;
	}
	public String getMBTI_NAME() {
		return MBTI_NAME;
	}
	public void setMBTI_NAME(String mBTI_NAME) {
		MBTI_NAME = mBTI_NAME;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public int getCOUNT() {
		return COUNT;
	}
	public void setCOUNT(int cOUNT) {
		COUNT = cOUNT;
	}
	public int getPARTY_ID() {
		return PARTY_ID;
	}
	public void setPARTY_ID(int pARTY_ID) {
		PARTY_ID = pARTY_ID;
	}
	public boolean isPARTY_REQUEST() {
		return PARTY_REQUEST;
	}
	public void setPARTY_REQUEST(boolean pARTY_REQUEST) {
		PARTY_REQUEST = pARTY_REQUEST;
	}
	@Override
	public String toString() {
		return "MemberListVO [USER_ID=" + USER_ID + ", PARTY_ID=" + PARTY_ID + ", PARTY_REQUEST=" + PARTY_REQUEST
				+ ", MBTI_NAME=" + MBTI_NAME + ", COUNT=" + COUNT + ", GENDERCOUNT=" + GENDERCOUNT + ", NAME=" + NAME
				+ "]";
	}
}
