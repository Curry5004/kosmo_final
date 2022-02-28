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

	public List<MbtiVO> getMbtiList(MbtiVO vo){
		System.out.println("===> Mybatis로  getMbtiList() 실행");
		return mybatis.selectList("MbtiDAO.getMbtiList", vo);
	}
}
