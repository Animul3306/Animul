package com.multi.animul.bbs;

public class PageVO {
	//����¡
	private int page; // ���� ������
	private int maxPage; // ��ü �ʿ��� ������ ����
	private int startPage; //���� ������ ���� ���������� ��
	private int endPage; //���� ������ ���� ������ ������ ��
	
	private int displypost;
	private int postNum;
	
	//�˻��� �ʿ��� ����
	private String type; 
	private String word; 
	
	
	
	public int getDisplypost() {
		return displypost;
	}

	public void setDisplypost(int displypost) {
		this.displypost = displypost;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
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
				+ ", displypost=" + displypost + ", postNum=" + postNum + ", type=" + type + ", word=" + word + "]";
	}





}
