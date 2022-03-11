package com.springbook.biz.mypage.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.party.PartyVO;
import com.springbook.biz.user.UserVO;

@Repository("mypageDAO")
public class MypageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserVO getUserInfo(UserVO vo){
		return mybatis.selectOne("MypageDAO.getUserInfo", vo);
	}
	
	public void updateUserInfo(UserVO vo){
		System.out.println("mybatis 업데이트 진입");
		mybatis.update("MypageDAO.updateUserInfo", vo);
		System.out.println("mybatis 처리 완료");
	}
	
	public List<PartyVO> getPartyMemberList(Map<String, Object> map) {
		return mybatis.selectList("MypageDAO.getPartyMemberList", map);
	}

	public int getPartyMemberListCnt(UserVO vo) {
		return mybatis.selectOne("BoardDAO.getPartyMemberListCnt", vo);
	}

//	public List<PartyVO> getPartyFavList(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	public int getPartyFavListCnt(PartyVO vo) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	public List<PartyVO> getPartyCreatorList(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	public int getPartyCreatorListCnt(PartyVO vo) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

}
