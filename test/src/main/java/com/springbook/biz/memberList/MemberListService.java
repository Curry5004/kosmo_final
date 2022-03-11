package com.springbook.biz.memberList;

import java.util.List;

public interface MemberListService {
	public void joinParty(MemberListVO vo);
	
	public List <MemberListVO> getMbtiList(MemberListVO vo);
	
	public List<MemberListVO> getGenderCount(MemberListVO vo);
	
	public void deletePartyMember(MemberListVO vo);
	
	public void memberFav(MemberListVO vo);
	
	public void deleteMemberFav(MemberListVO vo);
	
	public List<MemberListVO> getJoinMemberList(MemberListVO vo);
	
	public List<MemberListVO> getJoinMemberList2(MemberListVO vo);
	
	public List<MemberListVO> getFavList(MemberListVO vo);
	
	
	
}
	
