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
		System.out.println(vo.getParty_id());
		mybatis.insert("schDAO.insertSchDAO",vo);
	}
	
	public List<SchVO> getScheduleList(SchVO vo) {
		System.out.println(vo.getYear());
		System.out.println(vo.getMonth());
		return mybatis.selectList("schDAO.getScheduleList", vo);
		
	}
	
	public int getSchCnt(SchVO vo) {
		return mybatis.selectOne("schDAO.getScheduleCnt",vo);
	}
	
	public List<SchVO> getScheduleDetail(Map<String, Object> map){
		return mybatis.selectList("schDAO.getScheduleList", map);
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
}
