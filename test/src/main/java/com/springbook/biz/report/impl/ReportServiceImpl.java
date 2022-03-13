package com.springbook.biz.report.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.report.QnaVO;
import com.springbook.biz.report.ReportService;
import com.springbook.biz.report.ReportVO;

@Service("ReportService")
public class ReportServiceImpl implements ReportService{

	@Autowired
	ReportDAO reportBoardDAO;
	
	@Override
	public ReportVO getReport(Map<String, Object> map) throws Exception {
		ReportVO result = new ReportVO();
		result.setReportComList(reportBoardDAO.getReportBoardList(map));
		return result;
	}
	@Override
	public List<ReportVO> getReportList(Map<String, Object> map) throws Exception{
		List<ReportVO> reportList = reportBoardDAO.getReportBoardList(map);
		return reportList;
	}
	@Override
	public int getReportCnt(Map<String,Object> map) {
		return reportBoardDAO.getReportBoardCnt(map);
	}
	@Override
	public List<QnaVO> getQnaList(Map<String, Object> map) throws Exception {
		List<QnaVO> qnaList = reportBoardDAO.getQnaList(map);
		return qnaList;
	
	}
	
}
