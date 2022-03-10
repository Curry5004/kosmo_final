package com.springbook.biz.schedule.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.sch.SchVO;

@Repository("schDAO")
public class SchDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertSchedule(SchVO vo){
		mybatis.insert("schDAO.insertSchDAO",vo);
	}
	
	public List<SchVO> getScheduleList(SchVO vo) {
		return mybatis.selectList("schDAO.getScheduleList", vo);
	}
	
	public SchVO getMemberName(SchVO vo){
		return mybatis.selectOne("schDAO.getMemberName",vo);
	}
	
	public void scheduleReview(SchVO vo) {
		System.out.println(vo.toString());
		mybatis.insert("schDAO.scheduleReview",vo);
	}
	
	public int getSchCnt(SchVO vo) {
		return mybatis.selectOne("schDAO.getScheduleCnt",vo);
	}
	
	public List<SchVO> getScheduleDetail(Map<String, Object> map){
		return mybatis.selectList("schDAO.getScheduleList2", map);
	}
	
	public void schMemberCntUp(SchVO vo){
		mybatis.insert("schDAO.cntUp",vo);
	}
	
	public void schMemberCntDown(SchVO vo){
		mybatis.insert("schDAO.cntDown",vo);
	}
	
	public void deleteSch(SchVO vo) {
		mybatis.delete("schDAO.deleteSch",vo);
	}
	
	public int getCurrentMemberCnt(SchVO vo) {
		return mybatis.selectOne("schDAO.getCurrentMemberCnt", vo);
	}
	
	public List<SchVO> getCntList(SchVO vo){
		return mybatis.selectList("schDAO.getCntList", vo);
	}
}
