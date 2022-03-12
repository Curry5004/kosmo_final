package com.springbook.biz.mypage.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.springbook.biz.mypage.MypageService;
import com.springbook.biz.party.PartyVO;
import com.springbook.biz.user.UserVO;

@Service("mypageService")
public class MypageServiceimpl implements MypageService{
	@Autowired
	private MypageDAO mypageDAO;
	
	public UserVO getUserInfo(UserVO vo){
		return mypageDAO.getUserInfo(vo);
	}

	@Override
	public void updateUserInfo(UserVO vo) {
		mypageDAO.updateUserInfo(vo);
		
	}

	@Override
	public List<PartyVO> getPartyMemberList(Map<String, Object> map) {
		return mypageDAO.getPartyMemberList(map);
	}

	@Override
	public int getPartyMemberListCnt(UserVO vo) {
		return mypageDAO.getPartyMemberListCnt(vo);
	}

	@Override
	public List<PartyVO> getPartyFavList(Map<String, Object> map) {
		return  mypageDAO.getPartyFavList(map);
		}

	@Override
	public int getPartyFavListCnt(UserVO vo) {
		return mypageDAO.getPartyFavListCnt(vo);
		}

//	@Override
//	public List<PartyVO> getPartyFavList(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int getPartyFavListCnt(PartyVO vo) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public List<PartyVO> getPartyCreatorList(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int getPartyCreatorListCnt(PartyVO vo) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

}
