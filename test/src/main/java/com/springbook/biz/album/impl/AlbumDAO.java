package com.springbook.biz.album.impl;

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
}
