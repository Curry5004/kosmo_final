package com.springbook.biz.sch;

import java.util.List;
import java.util.Map;

import com.springbook.biz.album.AlbumVO;
import com.springbook.biz.board.BoardVO;

public interface ScheduleService {
	
	public void insertSchedule(SchVO vo);
	
	public List<SchVO> getScheduleList(SchVO vo);
	
	public int getSchCnt(SchVO vo);
	
	List<SchVO> getScheduleDetail(Map<String,Object> map);
	
	public void schMemberCntUp(SchVO vo);
	
	public void schMemberCntDown(SchVO vo);
	
	public void deleteSch(SchVO vo);
	
}
