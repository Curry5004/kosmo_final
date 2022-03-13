package com.springbook.biz.board.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAOMybatis BoardDAO;
	
	@Override
	public int getBoardCnt(BoardVO vo) {
		return BoardDAO.getBoardCnt(vo);
	}

	@Override
	public List<BoardVO> getBoardList(Map<String, Object> map) {
		return  BoardDAO.getBoardList(map);
	}

	@Override
	public void insertBoard(BoardVO vo) {
		BoardDAO.insertBoard(vo);
		
	}
	
	@Override
	public void updateBoard(BoardVO vo) {
		BoardDAO.updateBoard(vo);
		
	}
	
	@Override
	public void deleteBoard(BoardVO vo) {
		BoardDAO.deleteBoard(vo);
		
	}
	@Override
	public BoardVO getBoard(BoardVO vo) {
	 return BoardDAO.getBoard(vo);
		
	}
	@Override
	public void modifyBoard(BoardVO vo) {
		BoardDAO.modifyBoard(vo);
		
	}
	@Override
	public void updateBoardCnt(int art_id) {
		BoardDAO.updateBoardCnt(art_id);
		
	}
	
}
