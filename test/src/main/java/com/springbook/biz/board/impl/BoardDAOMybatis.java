package com.springbook.biz.board.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.BoardVO;

@Repository
public class BoardDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	

	public List<BoardVO> getBoardList(Map<String, Object> map){
		System.out.println("==> Mybatis getBoardList");
		return mybatis.selectList("BoardDAO.getBoardList", map);
	}

	public int getBoardCnt(BoardVO vo) {
		System.out.println("==> Mybatis getBoardCnt");
		return mybatis.selectOne("BoardDAO.getBoardCnt", vo);
	}
	
}
