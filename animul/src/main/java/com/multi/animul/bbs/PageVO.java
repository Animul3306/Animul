package com.multi.animul.bbs;

public class PageVO {
	//페이징
	private int page; // 현재 페이지
	private int maxPage; // 전체 필요한 페이지 갯수
	private int startPage; //현재 페이지 기준 시작페이지 값
	private int endPage; //현재 페이지 기준 마지막 페이지 값
	private int totalCount; // 전체 게시물 갯수
	private int pageLimit; //한 페이지당 보여줄 게시물 갯수
	
	//검색에 필요한 변수
	private String type; 
	private String word; 
	
	


	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}


	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
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

	@Override
	public String toString() {
		return "PageVO [page=" + page + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", totalCount=" + totalCount + ", pageLimit=" + pageLimit + ", type=" + type + ", word=" + word + "]";
	}

	


	





}
