package com.springbook.biz.main;

import java.util.List;
import java.util.Map;

import com.springbook.biz.party.PartyVO;


public interface MainService {
	public List<MbtiVO> getMbtiList(MbtiVO vo);
		
	public List<CategoryVO> getCategoryList(CategoryVO vo);

	public List<PartyVO> searchBestParty(Map<String,Object> map);
	
	
}
