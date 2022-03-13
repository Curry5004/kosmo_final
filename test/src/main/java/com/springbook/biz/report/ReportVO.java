package com.springbook.biz.report;

import java.util.ArrayList;
import java.util.List;

public class ReportVO {

	@Override
	public String toString() {
		return "ReportVO [reportList=" + reportList + ", qnaList=" + qnaList + "]";
	}

	private List<ReportVO> reportList;
	private List<QnaVO> qnaList;

	public List<QnaVO> getQnaList() {
		return qnaList;
	}

	public void setQnaList(List<QnaVO> qnaList) {
		this.qnaList = qnaList;
	}

	public List<ReportVO> getReportList() {
		return reportList;
	}

	public void setReportComList(List<ReportVO> reportComList) {
		reportList = reportComList;
	}

	
	
}