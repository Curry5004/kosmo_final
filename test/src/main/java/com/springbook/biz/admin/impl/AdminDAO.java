package com.springbook.biz.admin.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.admin.AdminVO;

@Repository("AdminDAO")
public class AdminDAO {
	@Autowired
	SqlSession mybatis;
	
	public List<AdminVO> getAdminList(AdminVO vo){
		return mybatis.selectList("adminDAO.getAdminList",vo);
	}
	public void  UpdateAdminPage(AdminVO vo){
		  mybatis.update("adminDAO.UpdateAdminPage",vo);
	}
}
