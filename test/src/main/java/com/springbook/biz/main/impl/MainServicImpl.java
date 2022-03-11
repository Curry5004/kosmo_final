package com.springbook.biz.main.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.main.CategoryVO;
import com.springbook.biz.main.MainService;
import com.springbook.biz.main.MbtiVO;
import com.springbook.biz.party.PartyVO;
import com.springbook.biz.party.impl.PartyDAO;

@Service("mainService")
public class MainServicImpl implements MainService {
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private PartyDAO PartyDAO;

	@Autowired
	private MbtiDAO mbtiDAO;

	public List<MbtiVO> getMbtiList(MbtiVO vo) {
		return mbtiDAO.getMbtiList(vo);
	}
	public List<CategoryVO> getCategoryList(CategoryVO vo) {
		return categoryDAO.getCategoryList(vo);
	}
	
	@Override
	public List<PartyVO> searchBestParty(Map<String,Object> map) {
		System.out.println("DAO 맵 : "+map.toString() );
		return PartyDAO.searchBestParty(map);
	}
}
