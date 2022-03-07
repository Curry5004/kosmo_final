package com.springbook.biz.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	List<BoardVO> getBoardList(Map<String,Object> map);
	int getBoardCnt(BoardVO vo);
	
	void insertBoard(BoardVO vo);

}
