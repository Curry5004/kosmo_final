package com.springbook.biz.report;

import java.util.List;
import java.util.Map;

public interface ReportService {
	
	public ReportVO getReport(Map <String, Object> map) throws Exception;

	List<ReportVO> getReportList(Map<String, Object> map) throws Exception;

	int getReportCnt(Map<String,Object> map);
	
	List<QnaVO> getQnaList(Map<String, Object> map) throws Exception;
}
