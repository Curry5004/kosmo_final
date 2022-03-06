package com.springbook.biz.party.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.party.PartyService;
import com.springbook.biz.party.PartyVO;

@Service("PartyService")
public class PartyServiceImpl implements PartyService {
	@Autowired
	private PartyDAOMybatis PartyDAO;

	@Override
	public List<PartyVO> getPartyList(Map<String, Object> map) {
		
		//System.out.println("Category list 뽑아오기");
		List<PartyVO> partyList = PartyDAO.getPartyList(map);
		
		//for (PartyVO party : partyList) {
			//System.out.println("---> " + party.toString());
		//}		
		return partyList;
	}

	@Override
	public int getPartyCnt(Map<String,Object> map) {
		return PartyDAO.getPartyCnt(map);
	}
}
