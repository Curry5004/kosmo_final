package com.springbook.biz.report.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.report.QnaVO;
import com.springbook.biz.report.ReportVO;

@Repository
public class ReportDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	public List<ReportVO> getReportBoardList(Map<String, Object> map)throws Exception{
		return mybatis.selectList("ReportDAO.getReportBoard", map);
	}
	public int getReportBoardCnt(Map<String, Object> map){
		return mybatis.selectOne("ReportDAO.getReportBoardCnt", map);
	}
	public List<QnaVO> getQnaList(Map<String, Object> map)throws Exception{
		return mybatis.selectList("ReportDAO.getQnaList", map);
	}

}
