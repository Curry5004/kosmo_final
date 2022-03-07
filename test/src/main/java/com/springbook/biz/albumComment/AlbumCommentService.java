package com.springbook.biz.albumComment;

import java.util.List;

public interface AlbumCommentService {
	public List<AlbumCommentVO> getAlbumCommentList(AlbumCommentVO vo);
	
	public void writeAlbumComment(AlbumCommentVO vo);
	
	public void deleteAlbumComment(AlbumCommentVO vo);
	
	public void modifyAlbumComment(AlbumCommentVO vo);
}
