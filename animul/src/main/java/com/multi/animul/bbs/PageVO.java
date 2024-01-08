package com.multi.animul.bbs;

public class PageVO {
	//페이징
	private int page; // 현재 페이지
	private int maxPage; // 전체 필요한 페이지 갯수
	private int startPage; //현재 페이지 기준 시작페이지 값
	private int endPage; //현재 페이지 기준 마지막 페이지 값
	
	//검색에 필요한 변수
	private String key; 
	private String word; 
	
	
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
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
				+ ", key=" + key + ", word=" + word + "]";
	}



}
