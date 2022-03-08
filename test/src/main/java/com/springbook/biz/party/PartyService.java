package com.springbook.biz.party;

import java.util.List;
import java.util.Map;

public interface PartyService {

	void insertParty(PartyVO vo);
	
	public PartyVO getParty(PartyVO vo);
	
	public void deleteParty(PartyVO vo);
	
	List<PartyVO> getPartyList(Map<String,Object> map);
	
	int getPartyCnt(Map<String,Object> map);
	
	public PartyVO getNewParty(PartyVO vo);
	
}
