package com.springbook.biz.memberList.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.memberList.MemberListVO;

@Repository
public class MemberListDAO {
	@Autowired
	SqlSession mybatis;
	
	public void joinParty(MemberListVO vo){
		mybatis.insert("memberListDAO.insertMemberList", vo);
	}
	
}
