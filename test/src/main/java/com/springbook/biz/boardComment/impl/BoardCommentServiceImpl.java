package com.springbook.biz.boardComment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.boardComment.BoardCommentService;
import com.springbook.biz.boardComment.BoardCommentVO;

@Service("boardCommentService")
public class BoardCommentServiceImpl implements BoardCommentService {
	@Autowired
	BoardCommentDAO BoardCommentDAO;

	public List<BoardCommentVO> getBoardCommentList(BoardCommentVO vo){
		return BoardCommentDAO.getBoardCommentList(vo);
	}

	@Override
	public void writeBoardComment(BoardCommentVO vo) {
		BoardCommentDAO.writeBoardComment(vo);
	}

	@Override
	public void deleteBoardComment(BoardCommentVO vo) {
		BoardCommentDAO.deleteBoardComment(vo);
	}

	@Override
	public void modifyBoardComment(BoardCommentVO vo) {
		BoardCommentDAO.modifyBoardComment(vo);
	}
}