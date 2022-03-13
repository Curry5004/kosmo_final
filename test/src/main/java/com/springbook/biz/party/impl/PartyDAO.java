package com.springbook.biz.party.impl;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.memberList.MemberListVO;
import com.springbook.biz.party.PartyVO;
import com.springbook.biz.user.UserVO;

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
	public PartyVO getNewParty(PartyVO vo){ 
		return mybatis.selectOne("PartyDAO.getNewParty", vo);
	}
	public List<PartyVO> getPartyList(Map<String, Object> map){
		return mybatis.selectList("PartyDAO.getPartyList", map);
	}
	public int getPartyCnt(Map<String, Object> map){
		return mybatis.selectOne("PartyDAO.getPartyCnt", map);
	}
	public PartyVO getRate(PartyVO vo){
		return mybatis.selectOne("PartyDAO.getRate", vo);
	}
	public List<PartyVO> searchBestParty(Map<String,Object> map){
		return mybatis.selectList("PartyDAO.searchBestParty", map);
	}
	
	//소모임 가입 현황자 리스트 보기
	public List<MemberListVO> getPartyUserList(Map<String,Object> map){
		System.out.println("마이바티스는 진입 함함?");
		return mybatis.selectList("PartyDAO.getPartyUserList", map);
	}
	public int getPartyUserListCnt(PartyVO vo){
		return mybatis.selectOne("PartyDAO.getPartyUserListCnt", vo);
	}
	//여기까지
	//소모임 가입 허가
	public void confirmMember(UserVO vo){
		System.out.println("컨펌 진행");
		mybatis.update("PartyDAO.confirmMember", vo);
	}
	//소모임 가입 ㄴㄴ
	public void deleteReg(UserVO vo){
		mybatis.update("PartyDAO.deleteReg",vo);
	}
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            