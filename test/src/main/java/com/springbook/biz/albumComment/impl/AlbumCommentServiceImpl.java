package com.springbook.biz.albumComment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.albumComment.AlbumCommentService;
import com.springbook.biz.albumComment.AlbumCommentVO;

@Service("albumCommentService")
public class AlbumCommentServiceImpl implements AlbumCommentService {
	@Autowired
	AlbumCommentDAO albumCommentDAO;
	
	public List<AlbumCommentVO> getAlbumCommentList(AlbumCommentVO vo){
		return albumCommentDAO.getAlbumCommentList(vo);
	}
	
	@Override
	public void writeAlbumComment(AlbumCommentVO vo) {
		albumCommentDAO.writeAlbumComment(vo);
	}
	
	@Override
	public void deleteAlbumComment(AlbumCommentVO vo) {
		albumCommentDAO.deleteAlbumComment(vo);
	}
	
	@Override
	public void modifyAlbumComment(AlbumCommentVO vo) {
		albumCommentDAO.modifyAlbumComment(vo);
	}
}
