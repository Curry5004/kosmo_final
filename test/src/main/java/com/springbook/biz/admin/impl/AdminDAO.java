package com.springbook.biz.admin.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.party.PartyVO;
import com.springbook.biz.user.UserVO;

@Repository("adminDAO")
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<UserVO> getAdminMemberList(Map<String,Object> map) {
		return  mybatis.selectList("AdminDAO.getAdminMemberList", map);
	}

	public int getAdminMemberListCnt() {
		return mybatis.selectOne("AdminDAO.getAdminMemberListCnt");
	}
	public void confirmMember(UserVO vo) {
		mybatis.update("AdminDAO.confirmMember", vo);
	}
	
	public void deleteReg(UserVO vo){
		mybatis.delete("AdminDAO.deleteReg", vo);
	}
	
	public void deleteUser(UserVO vo){
		mybatis.delete("AdminDAO.deleteUser", vo);
	}

}
