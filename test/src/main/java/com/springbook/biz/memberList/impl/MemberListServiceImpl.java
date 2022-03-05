package com.springbook.biz.memberList.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.memberList.MemberListService;
import com.springbook.biz.memberList.MemberListVO;

@Service("memberListService")
public class MemberListServiceImpl implements MemberListService{
	@Autowired
	MemberListDAO memberListDAO;
	
	public void joinParty(MemberListVO vo){
	 memberListDAO.joinParty(vo);
	}
	
	public List <MemberListVO> getMbtiList(MemberListVO vo){
		return memberListDAO.getMbtiList(vo);
	}
	public List <MemberListVO> getGenderCount(MemberListVO vo){
		return memberListDAO.getGenderCount(vo);
	}
	
}
