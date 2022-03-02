package com.springbook.biz.common.vo;


public class ResultBody {

	String resultCode;
	String resultMsg;
	Object resultBody;
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public String getResultMsg() {
		return resultMsg;
	}
	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}
	public Object getResultBody() {
		return resultBody;
	}
	public void setResultBody(Object resultBody) {
		this.resultBody = resultBody;
	}
	@Override
	public String toString() {
		return "ResultBody [resultCode=" + resultCode + ", resultMsg=" + resultMsg + ", resultBody=" + resultBody + "]";
	}
}
