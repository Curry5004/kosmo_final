package com.springbook.biz.boardComment;

import java.util.List;

public interface BoardCommentService {
	public List<BoardCommentVO> getBoardCommentList(BoardCommentVO vo);

	public void writeBoardComment(BoardCommentVO vo);

	public void deleteBoardComment(BoardCommentVO vo);

	public void modifyBoardComment(BoardCommentVO vo);
}