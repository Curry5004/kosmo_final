package com.springbook.biz.memberList.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.memberList.MemberListVO;

@Service
public class MemberListServiceImpl {
	@Autowired
	MemberListDAO memberListDAO;
	

	
}
