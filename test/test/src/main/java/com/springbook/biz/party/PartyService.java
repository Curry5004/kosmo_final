package com.springbook.biz.party;


public interface PartyService {

	void insertParty(PartyVO vo);
	
	public PartyVO getParty(PartyVO vo);
	
	public void deleteParty(PartyVO vo);
	
	public PartyVO getNewParty(PartyVO vo);
	
}
