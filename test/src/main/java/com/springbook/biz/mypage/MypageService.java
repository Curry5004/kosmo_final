package com.springbook.biz.mypage;

import java.util.List;
import java.util.Map;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.party.PartyVO;
import com.springbook.biz.user.UserVO;

public interface MypageService {
	//회원 정보 받아오기
	public UserVO getUserInfo(UserVO vo);
	
	//회원 정보 업데이트하기
	public void updateUserInfo(UserVO vo);
	
	//가입된 소모임 리스트 뽑아오기.
	public List<PartyVO> getPartyMemberList(Map<String,Object> map);
	public int getPartyMemberListCnt(UserVO vo);

	//찜한 소모임 리스트 뽑아오기.
	public List<PartyVO> getPartyFavList(Map<String,Object> map);
	public int getPartyFavListCnt(UserVO vo);
		
	//만든 소모임 리스트 뽑아오기.
	public List<PartyVO> getPartyCreatorList(Map<String,Object> map);
	public int getPartyCreatorListCnt(UserVO vo);
	
	//마이페이지 인덱스에서 찜한소모임, 가입된 소모임 리스트
	public MypageVO getMypage(Map <String, Object> map)throws Exception;
	

}
