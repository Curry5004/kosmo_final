package com.springbook.biz.schedule.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.sch.SchVO;

@Repository("schDAO")
public class SchDAO {
	@Autowired
	SqlSession mybatis;
	
	public void insertSchedule(SchVO vo){
		System.out.println(vo.getParty_id());
		mybatis.insert("schDAO.insertSchDAO",vo);
	}

}
