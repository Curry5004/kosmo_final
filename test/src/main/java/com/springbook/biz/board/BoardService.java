package com.springbook.biz.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	List<BoardVO> getBoardList(Map<String,Object> map);
	int getBoardCnt(BoardVO vo);
	
	public void insertBoard(BoardVO vo);
	
	public void updateBoard(BoardVO vo);
	
	public void deleteBoard(BoardVO vo);
	
	public BoardVO getBoard(BoardVO vo);
	

}
