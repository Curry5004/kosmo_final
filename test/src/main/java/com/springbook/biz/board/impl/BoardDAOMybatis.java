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
	public void insertBoard(BoardVO vo) {
		System.out. println ("===> Mybatis로 insertBoard() 기능 처리"); 
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
	public void updateBoard(BoardVO vo) {
		System.out. println ("===> Mybatis로 updateBoard() 기능 처리"); 
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	public void deleteBoard(BoardVO vo) {
		System.out. println ("===> Mybatis로 deleteBoard() 기능 처리"); 
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}
	public BoardVO getBoard(BoardVO vo) {
		System.out. println ("===> Mybatis로 getBoard() 기능 처리"); 
		return (BoardVO) mybatis.selectOne("BoardDAO.getBoard", vo);
	}
	public void modifyBoard(BoardVO vo) {
		System.out. println ("===> Mybatis로 modifyBoard() 기능 처리"); 
		mybatis.selectOne("BoardDAO.modifyBoard", vo);
	}
	public void updateBoardCnt(int art_id) {
		System.out. println ("===> Mybatis로 updateBoardCnt() 기능 처리"); 
		mybatis.update("BoardDAO.updateBoardCnt", art_id);
	}

}
