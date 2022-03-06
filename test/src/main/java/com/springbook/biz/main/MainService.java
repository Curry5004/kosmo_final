package com.springbook.biz.main;

import java.util.List;


public interface MainService {
	List<MbtiVO> getMbtiList(MbtiVO vo);
	
	List<CategoryVO_> getCategoryList(CategoryVO_ vo);
}
