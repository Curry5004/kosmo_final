package com.springbook.biz.admin;

import java.util.List;
import java.util.Map;

import com.springbook.biz.user.UserVO;

public interface AdminService {
	public List<UserVO> getAdminMemberList(Map<String,Object> map);
	public int getAdminMemberListCnt();

}
