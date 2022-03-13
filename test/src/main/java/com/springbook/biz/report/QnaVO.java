package com.springbook.biz.report;

public class QnaVO {
	private String QNA_ID;
	private String Question;
	private String Answer;
	public String getQNA_ID() {
		return QNA_ID;
	}
	public void setQNA_ID(String qNA_ID) {
		QNA_ID = qNA_ID;
	}
	public String getQuestion() {
		return Question;
	}
	public void setQuestion(String question) {
		Question = question;
	}
	public String getAnswer() {
		return Answer;
	}
	public void setAnswer(String answer) {
		Answer = answer;
	}
	@Override
	public String toString() {
		return "QnaVO [QNA_ID=" + QNA_ID + ", Question=" + Question + ", Answer=" + Answer + "]";
	}
	
}
