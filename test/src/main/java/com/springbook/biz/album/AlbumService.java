package com.springbook.biz.album;

import java.util.List;
import java.util.Map;

public interface AlbumService {
	public void insertAlbum(AlbumVO vo);
	
	public int getAlbumCnt(AlbumVO vo);
	
	public List<AlbumVO> getAlbumList(AlbumVO vo);
	
	public AlbumVO getAlbum(AlbumVO vo);
	
	public void likeUp(AlbumVO vo);
	
	public void likeDown(AlbumVO vo);
	
	public List<AlbumVO> getLikeList(AlbumVO vo);
}
