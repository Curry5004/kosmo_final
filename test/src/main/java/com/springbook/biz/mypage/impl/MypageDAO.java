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
		System.out.println("마이바티스 진입 완료");
		return mybatis.selectOne("MypageDAO.getPartyMemberListCnt", vo);
	}

	public List<PartyVO> getPartyFavList(Map<String, Object> map) {
		return  mybatis.selectList("MypageDAO.getPartyFavList", map);
	}

	public int getPartyFavListCnt(UserVO vo) {
		return mybatis.selectOne("MypageDAO.getPartyFavListCnt", vo);
	}

	public List<PartyVO> getPartyCreatorList(Map<String, Object> map) {
		return  mybatis.selectList("MypageDAO.getPartyCreatorList", map);
	}

	public int getPartyCreatorListCnt(UserVO vo) {
		return mybatis.selectOne("MypageDAO.getPartyCreatorListCnt", vo);
	}
	// 인덱스 페이지에서 리스트 뽑아오는 로직.
	public List<PartyVO> getFavParty(Map<String, Object> map)throws Exception{
		return mybatis.selectList("MypageDAO.getFavParty", map);
	}
	public List<PartyVO> getMyParty(Map<String, Object> map)throws Exception{
		return mybatis.selectList("MypageDAO.getMyParty", map);
	}
	

}
