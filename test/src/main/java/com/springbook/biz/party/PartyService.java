package com.springbook.biz.party;

import java.util.List;
import java.util.Map;

public interface PartyService {
	List<PartyVO> getPartyList(Map<String,Object> map);
	int getPartyCnt(Map<String,Object> map);
}
