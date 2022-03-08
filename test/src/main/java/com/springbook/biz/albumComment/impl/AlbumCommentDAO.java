package com.springbook.biz.albumComment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.albumComment.AlbumCommentVO;

@Repository
public class AlbumCommentDAO {
	@Autowired
	SqlSessionTemplate mybatis;

	public List<AlbumCommentVO> getAlbumCommentList(AlbumCommentVO vo){
		return mybatis.selectList("AlbumCommentDAO.getAlbumCommentList", vo);
	}
	
	public void writeAlbumComment(AlbumCommentVO vo){
		mybatis.insert("AlbumCommentDAO.writeAlbumComment", vo);
	}
	
	public void deleteAlbumComment(AlbumCommentVO vo){
		mybatis.update("AlbumCommentDAO.deleteAlbumComment", vo);
	}
	
	public void modifyAlbumComment(AlbumCommentVO vo){
		mybatis.update("AlbumCommentDAO.modifyAlbumComment", vo);
	}
}
