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
	
	public List<AlbumVO> getAlbumList(Map<String,Object> map){
		return mybatis.selectList("AlbumDAO.getAlbumList", map);
	}
	
}
