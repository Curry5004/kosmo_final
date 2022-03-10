package com.springbook.biz.album.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.springbook.biz.album.AlbumService;
import com.springbook.biz.album.AlbumVO;

@Service("albumService")
public class AlbumServiceImpl implements AlbumService{
	@Autowired
	AlbumDAO albumDAO;
	
	@Override
	public void insertAlbum(AlbumVO vo) {
		albumDAO.insertAlbum(vo);
	}
	@Override
	public int getAlbumCnt(AlbumVO vo) {
		return albumDAO.getAlbumCnt(vo);
	}

	@Override
	public List<AlbumVO> getAlbumList(AlbumVO vo) {
		return albumDAO.getAlbumList(vo);
	}
	
	@Override
	public AlbumVO getAlbum(AlbumVO vo) {
		return albumDAO.getAlbum(vo);
	}
	
	@Override
	public void likeUp(AlbumVO vo) {
		albumDAO.likeUp(vo);
	}
	
	@Override
	public List<AlbumVO> getLikeList(AlbumVO vo) {
		return albumDAO.getLikeList(vo);
	}
	
	@Override
	public void likeDown(AlbumVO vo) {
		albumDAO.likeDown(vo);
	}
}
