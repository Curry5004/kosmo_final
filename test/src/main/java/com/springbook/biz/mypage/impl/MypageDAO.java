package com.springbook.biz.mypage.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.party.PartyVO;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	public List<PartyVO> getFavParty(Map<String, Object> map)throws Exception{
		return mybatis.selectList("MypageDAO.getFavParty", map);
	}
	public List<PartyVO> getMyParty(Map<String, Object> map)throws Exception{
		return mybatis.selectList("MypageDAO.getMyParty", map);
	}

}
