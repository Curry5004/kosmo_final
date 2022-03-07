package com.springbook.biz.party.impl;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.party.PartyVO;

@Repository
public class PartyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertParty(PartyVO vo){
		mybatis.insert("PartyDAO.insertParty", vo);
	}
	public PartyVO getParty(PartyVO vo){
		return mybatis.selectOne("PartyDAO.getParty", vo);
	}
	public void deleteParty(PartyVO vo){
	 mybatis.delete("PartyDAO.deleteParty",vo);
	}
	public List<PartyVO> getPartyList(Map<String, Object> map){
		return mybatis.selectList("PartyDAO.getPartyList", map);
	}
	public int getPartyCnt(Map<String, Object> map){
		return mybatis.selectOne("PartyDAO.getPartyCnt", map);
	}
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            