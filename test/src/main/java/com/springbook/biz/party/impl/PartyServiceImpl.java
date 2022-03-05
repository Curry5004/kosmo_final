package com.springbook.biz.party.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.party.PartyService;
import com.springbook.biz.party.PartyVO;

@Service("partyService")
public class PartyServiceImpl implements PartyService{
	@Autowired
	PartyDAO partyDAO;
	
	@Override
	public void insertParty(PartyVO vo) {
		partyDAO.insertParty(vo);
	}

	@Override
	public PartyVO getParty(PartyVO vo) {
		return partyDAO.getParty(vo);
	}
	@Override
	public void deleteParty(PartyVO vo){
		partyDAO.deleteParty(vo);
	}
	
	@Override
	public PartyVO getNewParty(PartyVO vo){
		return partyDAO.getNewParty(vo);
	};
	

}
