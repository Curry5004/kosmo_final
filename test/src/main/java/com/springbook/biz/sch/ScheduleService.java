package com.springbook.biz.sch;

import java.util.List;
import java.util.Map;

public interface ScheduleService {
	
	public void insertSchedule(SchVO vo);
	
	public List<SchVO> getScheduleList(SchVO vo);
	
	public List<SchVO> getScheduleList2(SchVO vo);
	
	public void scheduleReview(SchVO vo); //별점 평가
	
	public int getSchCnt(SchVO vo); // 스케쥴 전체갯수 조회
	
	public int getSchCnt2(SchVO vo); // 마이페이지 스케쥴 전체갯수 조회
	
	public List<SchVO> getScheduleDetail(Map<String,Object> map); // 스케쥴 상세보기
	
	public List<SchVO> getScheduleDetail2(Map<String,Object> map); // 스케쥴 상세보기
	
	public void schMemberCntUp(SchVO vo); // 스케줄 가입
	
	public void schMemberCntDown(SchVO vo); //스케줄 탈퇴
	
	public void deleteSch(SchVO vo); // 일정 삭제하기
	
	public int getCurrentMemberCnt(int sch_id ); // 일정 현재인원
	
	public List<SchVO> getCntList(Map<String,Object> cntList); // 가입한 사람 목록 가져오기
	
	public SchVO getNewSchedule(SchVO vo);
}
