package com.springbook.biz.memberList.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.memberList.MemberListService;
import com.springbook.biz.memberList.MemberListVO;

@Service("memberListService")
public class MemberListServiceImpl implements MemberListService{
	@Autowired
	MemberListDAO memberListDAO;
	
	public void joinParty(MemberListVO vo){;
	 memberListDAO.joinParty(vo);
	}
	
}
