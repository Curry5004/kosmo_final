package com.springbook.biz.mypage.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.mypage.MypageService;
import com.springbook.biz.mypage.MypageVO;

@Service("MypageService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	MypageDAO mypageDAO;

	@Override
	public MypageVO getMypage(Map<String, Object> map) throws Exception{
		MypageVO result = new MypageVO();
		result.setFavPartyList(mypageDAO.getFavParty(map));
		result.setMyPartyList(mypageDAO.getMyParty(map));
		return result;
	}

}
