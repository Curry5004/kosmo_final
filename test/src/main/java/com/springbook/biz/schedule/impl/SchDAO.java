package com.springbook.biz.schedule.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
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
}
