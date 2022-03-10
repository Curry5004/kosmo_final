package com.springbook.biz.album.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.album.AlbumVO;

@Repository
public class AlbumDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertAlbum(AlbumVO vo){
	mybatis.insert("AlbumDAO.insertAlbum",vo);
	}
	
	public int getAlbumCnt(AlbumVO vo){
		return mybatis.selectOne("AlbumDAO.getAlbumCnt", vo);
	}
	
	public List<AlbumVO> getAlbumList(AlbumVO vo){

		System.out.println(vo.toString());
		return mybatis.selectList("AlbumDAO.getAlbumList", vo);
	}
	
	public AlbumVO getAlbum(AlbumVO vo){
		return mybatis.selectOne("AlbumDAO.getAlbum", vo);
	}
	
	public void likeUp(AlbumVO vo){
		System.out.println("작성자 : "+vo.getUser_id()+" id: "+vo.getAlb_id()+"파티 "+vo.getParty_id());
		mybatis.insert("AlbumDAO.likeUp",vo);
	}
	
	public List<AlbumVO> getLikeList(AlbumVO vo){
		return mybatis.selectList("AlbumDAO.getLikeList", vo);
	}
	
	public void likeDown(AlbumVO vo){
		mybatis.insert("AlbumDAO.likeDown",vo);
	}
}
