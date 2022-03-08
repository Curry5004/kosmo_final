package com.springbook.biz.sch;

import java.util.List;
import java.util.Map;

public interface ScheduleService {
	
	public void insertSchedule(SchVO vo);
	
	public List<SchVO> getScheduleList(SchVO vo);
	
	public SchVO getMemberName (SchVO vo);
	
	public void scheduleReview(SchVO vo);
	
	public int getSchCnt(SchVO vo);
	
	public List<SchVO> getScheduleDetail(Map<String,Object> map);
	
	public void schMemberCntUp(SchVO vo);
	
	public void schMemberCntDown(SchVO vo);
	
	public void deleteSch(SchVO vo);
}

