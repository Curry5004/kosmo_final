package com.springbook.biz.boardComment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.boardComment.BoardCommentVO;

@Repository
public class BoardCommentDAO {
	@Autowired
	SqlSessionTemplate mybatis;

	public List<BoardCommentVO> getBoardCommentList(BoardCommentVO vo){
		return mybatis.selectList("BoardCommentDAO.getBoardCommentList", vo);
	}

	public void writeBoardComment(BoardCommentVO vo){
		mybatis.insert("BoardCommentDAO.writeBoardComment", vo);
	}

	public void deleteBoardComment(BoardCommentVO vo){
		mybatis.update("BoardCommentDAO.deleteBoardComment", vo);
	}

	public void modifyBoardComment(BoardCommentVO vo){
		mybatis.update("BoardCommentDAO.modifyBoardComment", vo);
	}
}