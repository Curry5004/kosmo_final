package com.springbook.biz.party.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.party.PartyVO;

@Repository
public class PartyDAO {
	@Autowired
	SqlSession mybatis;
	
	public void insertParty(PartyVO vo){
		mybatis.insert("PartyDAO.insertParty", vo);
	}
	public PartyVO getParty(PartyVO vo){
		return mybatis.selectOne("PartyDAO.getParty", vo);
	}
	public void deleteParty(PartyVO vo){
	    mybatis.delete("PartyDAO.deleteParty",vo);
	}
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            