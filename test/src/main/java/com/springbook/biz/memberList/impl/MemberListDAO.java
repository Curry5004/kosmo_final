package com.springbook.biz.memberList.impl;

import java.util.List;

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
	public List<MemberListVO> getMbtiList(MemberListVO vo){
		return mybatis.selectList("memberListDAO.getMbtiList",vo);
	}
	public List<MemberListVO> getGenderCount(MemberListVO vo){
		return mybatis.selectList("memberListDAO.getGenderCount",vo);
	}
	public void deletePartyMember(MemberListVO vo){
		mybatis.delete("memberListDAO.deletePartyMember",vo);
	}
	public void memberFav(MemberListVO vo){
		mybatis.insert("memberListDAO.memberFav",vo);
	}
	public List<MemberListVO> getJoinMemberList(MemberListVO vo){
		return  mybatis.selectList("memberListDAO.getJoinedMemberList",vo);
	}

}
