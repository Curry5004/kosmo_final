package com.springbook.biz.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.admin.AdminService;
import com.springbook.biz.mypage.MypageService;
import com.springbook.biz.mypage.impl.MypageDAO;
import com.springbook.biz.user.UserVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public List<UserVO> getAdminMemberList(Map<String, Object> map) {
		return adminDAO.getAdminMemberList(map);
	}
	@Override
	public int getAdminMemberListCnt() {
		return adminDAO.getAdminMemberListCnt();
	}
	@Override
	public void confirmMember(UserVO vo) {
		adminDAO.confirmMember(vo);
		
	}
	@Override
	public void deleteUser(UserVO vo) {
		adminDAO.deleteReg(vo);
		adminDAO.deleteUser(vo);
	};

}
