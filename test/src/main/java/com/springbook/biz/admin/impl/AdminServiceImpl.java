package com.springbook.biz.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.admin.AdminService;
import com.springbook.biz.admin.AdminVO;

@Service("adminService") 
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public List<AdminVO> getAdminList(AdminVO vo) {
		return adminDAO.getAdminList(vo);
	}
	
}
