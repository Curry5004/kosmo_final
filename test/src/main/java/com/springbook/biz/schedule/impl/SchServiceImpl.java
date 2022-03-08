package com.springbook.biz.schedule.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.party.PartyVO;
import com.springbook.biz.sch.SchVO;
import com.springbook.biz.sch.ScheduleService;

@Service("scheduleService")
public class SchServiceImpl implements ScheduleService {
	@Autowired
	SchDAO schDAO;

	@Override
	public void insertSchedule(SchVO vo) {
		System.out.println(vo.getSch_title());
		schDAO.insertSchedule(vo);
		
	}
	
	@Override
	public List<SchVO> getScheduleList(SchVO vo) {
		return schDAO.getScheduleList(vo);
		
	}

	@Override
	public SchVO getMemberName(SchVO vo) {
		System.out.println("유저 이름 가져오기 로그");
		return schDAO.getMemberName(vo);
	}

	
}
