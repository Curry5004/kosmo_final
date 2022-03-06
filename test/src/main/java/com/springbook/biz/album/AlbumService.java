package com.springbook.biz.album;

import java.util.List;
import java.util.Map;

public interface AlbumService {
	public void insertAlbum(AlbumVO vo);
	
	public int getAlbumCnt(AlbumVO vo);
	
	public List<AlbumVO> getAlbumList(Map<String,Object> map);
}
