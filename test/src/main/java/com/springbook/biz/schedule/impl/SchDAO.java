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
	
	public List<SchVO> getScheduleList2(SchVO vo) {
		return mybatis.selectList("schDAO.getScheduleList3", vo);
	}
	
	
	public void scheduleReview(SchVO vo) {
		System.out.println(vo.toString());
		mybatis.insert("schDAO.scheduleReview",vo);
	}
	
	public int getSchCnt(SchVO vo) {
		return mybatis.selectOne("schDAO.getScheduleCnt",vo);
	}
	
	public int getSchCnt2(SchVO vo) {
		return mybatis.selectOne("schDAO.getScheduleCnt2",vo);
	}
	
	public List<SchVO> getScheduleDetail(Map<String, Object> map){
		return mybatis.selectList("schDAO.getScheduleList2", map);
	}
	
	public List<SchVO> getScheduleDetail2(Map<String, Object> map){
		return mybatis.selectList("schDAO.getScheduleList4", map);
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
	
	public int getCurrentMemberCnt(int sch_id) {
		return mybatis.selectOne("schDAO.getCurrentMemberCnt", sch_id);
	}
	
	public List<SchVO> getCntList(Map<String, Object> cntList){
		return mybatis.selectList("schDAO.getCntList", cntList);
	}
	
	public SchVO getNewSchedule(SchVO vo){
		return mybatis.selectOne("schDAO.getNewSchedule", vo);
	}
}
