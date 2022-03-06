package com.springbook.biz.main.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.main.CategoryVO;


@Repository
public class CategoryDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 카테고리 리스트 호출
	public List<CategoryVO> getCategoryList(CategoryVO vo) {
		return mybatis.selectList("CategoryDAO.getCategoryList", vo);
	}
}
