package com.springbook.biz.sch;

import java.util.List;

public interface ScheduleService {
	
	public void insertSchedule(SchVO vo);
	
	public List<SchVO> getScheduleList(SchVO vo);
}
