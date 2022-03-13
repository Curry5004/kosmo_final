package com.springbook.biz.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	public List<BoardVO> getBoardList(Map<String,Object> map);
	
	public int getBoardCnt(BoardVO vo);
	
	public void insertBoard(BoardVO vo);
	
	public void updateBoard(BoardVO vo);
	
	public void deleteBoard(BoardVO vo);
	
	public void modifyBoard(BoardVO vo);
	
	public BoardVO getBoard(BoardVO vo);
	
	public void updateBoardCnt(int art_id);

}
