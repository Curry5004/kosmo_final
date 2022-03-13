package com.springbook.biz.mypage.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.springbook.biz.mypage.MypageService;
import com.springbook.biz.party.PartyVO;
import com.springbook.biz.user.UserVO;
import com.springbook.biz.mypage.MypageVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
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


	@Override
	public List<PartyVO> getPartyCreatorList(Map<String, Object> map) {
		return mypageDAO.getPartyCreatorList(map);
	}

	@Override
	public int getPartyCreatorListCnt(UserVO vo) {
		return mypageDAO.getPartyCreatorListCnt(vo);
	}
	
	@Override
	public MypageVO getMypage(Map<String, Object> map) throws Exception{
		MypageVO result = new MypageVO();
		result.setFavPartyList(mypageDAO.getFavParty(map));
		result.setMyPartyList(mypageDAO.getMyParty(map));
		return result;
	}
 
}
