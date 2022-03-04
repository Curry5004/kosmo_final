package com.springbook.biz.memberList;

public class MemberListVO {
	private String USER_ID;
	private int PARTY_ID;
	private boolean PARTY_REQUEST;
	
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
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
		return "MemberListVO [USER_ID=" + USER_ID + ", PARTY_ID=" + PARTY_ID + ", PARTY_REQUEST=" + PARTY_REQUEST + "]";
	}
	
}
