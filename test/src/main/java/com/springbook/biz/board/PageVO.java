package com.springbook.biz.board;

public class PageVO {
	@Override
	public String toString() {
		return "PageVO [total=" + total + ", currentPage=" + currentPage + ", pageNo=" + pageNo + ", totalPages="
				+ totalPages + ", startPage=" + startPage + ", endPage=" + endPage + ", pageSize=" + pageSize + "]";
	}
	private int total; //전체 게시글 수 
	private int currentPage;
	private String pageNo;
	private int totalPages;
	private int startPage; 
	private int endPage;
	private int pageSize; 
	
	public PageVO() {} 
	public PageVO(int total, int currentPage, int listSize, int pageSize) {
		this.total = total; 
		this.currentPage = currentPage;  
		this.pageSize =pageSize;
		if (total == 0) {
			totalPages=0; 
			startPage=0; 
			endPage=0; 
		}else { 
			totalPages = total/listSize; 
			if(total%listSize > 0) {
				totalPages ++ ; 
			}
			int modVal = currentPage % pageSize; 
			startPage = currentPage / pageSize * pageSize +1; 
			if (modVal == 0) startPage -= pageSize; 
			
			endPage = startPage + pageSize-1; 
			if(endPage> totalPages) endPage =totalPages;
		}
	}


	public boolean hasNoBoard() {
		return total==0;
	}
	
	public boolean hasBoard() {
		return total > 0;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
}
