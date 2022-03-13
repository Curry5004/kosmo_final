package com.springbook.biz.mypage;

import java.util.List;

import com.springbook.biz.party.PartyVO;

public class MypageVO {

	private List<PartyVO> favPartyList;
	private List<PartyVO> myPartyList;
	
	public List<PartyVO> getFavPartyList() {
		return favPartyList;
	}
	public void setFavPartyList(List<PartyVO> favPartyList) {
		this.favPartyList = favPartyList;
	}
	public List<PartyVO> getMyPartyList() {
		return myPartyList;
	}
	public void setMyPartyList(List<PartyVO> myPartyList) {
		this.myPartyList = myPartyList;
	}
	@Override
	public String toString() {
		return "MypageVO [favPartyList=" + favPartyList + ", myPartyList=" + myPartyList + "]";
	}
}
	
