package com.springbook.biz.party;

import java.util.List;
import java.util.Map;

import com.springbook.biz.memberList.MemberListVO;
import com.springbook.biz.user.UserVO;

public interface PartyService {

	public void insertParty(PartyVO vo);
	
	public PartyVO getParty(PartyVO vo);
	
	public void deleteParty(PartyVO vo);
	
	public List<PartyVO> getPartyList(Map<String,Object> map);
	
	public int getPartyCnt(Map<String,Object> map);
	
	public PartyVO getNewParty(PartyVO vo);
	
	public PartyVO getRate(PartyVO vo);
	
	//소모임 가입 현황자 리스트 보기
	public List<MemberListVO> getPartyUserList(Map<String,Object> map);
	public int getPartyUserListCnt(PartyVO vo);

	//소모임 가입 허가
	public void confirmMember(UserVO vo);
	//소모임 가입 ㄴㄴ
	public void deleteReg(UserVO vo);
	
}
