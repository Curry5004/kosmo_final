package com.springbook.biz.main.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.main.MbtiVO;

@Repository
public class MbtiDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//MBTI 리스트 호출
	public List<MbtiVO> getMbtiList(MbtiVO vo){
		return mybatis.selectList("MbtiDAO.getMbtiList", vo);
	}

}
