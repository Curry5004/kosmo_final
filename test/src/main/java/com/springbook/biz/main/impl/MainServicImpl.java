package com.springbook.biz.main.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.main.CategoryVO_;
import com.springbook.biz.main.MainService;
import com.springbook.biz.main.MbtiVO;

@Service("mainService")
public class MainServicImpl implements MainService {
	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private MbtiDAO mbtiDAO;

	public List<MbtiVO> getMbtiList(MbtiVO vo) {
		return mbtiDAO.getMbtiList(vo);
	}

	public List<CategoryVO_> getCategoryList(CategoryVO_ vo) {
		return categoryDAO.getCategoryList(vo);
	}
}
