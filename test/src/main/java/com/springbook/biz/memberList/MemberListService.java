package com.springbook.biz.memberList;

import java.util.List;

public interface MemberListService {
	public void joinParty(MemberListVO vo);
	
	public List <MemberListVO> getMbtiList(MemberListVO vo);
	
	public List<MemberListVO> getGenderCount(MemberListVO vo);
	
}
	
