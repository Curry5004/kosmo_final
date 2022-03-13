package com.springbook.biz.admin;

import java.util.List;
import java.util.Map;

import com.springbook.biz.user.UserVO;

public interface AdminService {
	//회원 리스트 뽑아오기
	public List<UserVO> getAdminMemberList(Map<String,Object> map);
	public int getAdminMemberListCnt();
	//회원 수락하기
	public void confirmMember(UserVO vo);
	//registry, user 테이블에서 회원 제거하기.
	public void deleteUser(UserVO vo);
	
}
