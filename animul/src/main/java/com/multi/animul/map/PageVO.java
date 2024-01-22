package com.multi.animul.map;

public class PageVO {

	private int start; // 첫 페이지 번호
	private int end; // 끝 페이지 번호 
	private int page; // 현재 페이지 번호 (start ~ end 사이의 현재 페이지 번호 1~10 사이의 값)

	private int startPage;
	private int endPage;
	private int curPage;// 현재 페이지 번호 (전체 페이지 숫자 사이의 번호 11~20, 21~30....)
	private int totalRecordCount;  //전체 데이터 수
	private int totalPageCount;  //전체 페이지 수
	private int limitStart;	// limit 시작 위치
	private boolean existPrevPage; // 이전 페이지 존재
	private boolean existNextPage; // 다음 페이지 존재
					
	private int recordSize; // 페이지당 출력 데이터 개수
	private int pageSize; // 화면 하단에 출력할 페이지 사이즈

	private String currentAddress; // 검색할 주소
	private String keywordSearch;

	public PageVO() {
		this.curPage = 1;
		
		this.page = 1;
		this.recordSize = 10;
		this.pageSize = 10;
	}

	public void calculation(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
		totalPageCount = ((totalRecordCount - 1) / getRecordSize()) +1; // 전체 페이지 수
		//현재 페이지 번호가 전체 페이지 수보다 큰 경우, 현재 페이지에 전체 페이지 수 저장
		if(getPage() > totalPageCount) {
			setPage(totalPageCount);
		}
		
		start = ( (getPage()-1) / getPageSize() ) * getPageSize() + 1;		//첫 페이지 번호
		end = start + getPageSize() - 1; 	// 끝 페이지 번호
		
		if(end > totalPageCount) { end = totalPageCount; }
		
		limitStart = (getPage()-1) * getRecordSize(); // limit 시작 위치 계산
		 // 이전 페이지 존재여부 existPrevPage  = start != 1 
//		start = start + limitStart;
//		end = end + limitStart;
		
		if(start == 1)
			existPrevPage = false;		
		else
			existPrevPage = true; 
		
		int trc = totalRecordCount - (getRecordSize() * getPage());
		System.out.println("calculation :  trc:" +trc + ", totalRecordCount : " + totalRecordCount + 
							", getRecordSize(): " + getRecordSize() + ", getPage():" + getPage() );
		if(totalRecordCount - (getRecordSize() * getPage()) > 0) 
			existNextPage = true; 
		else
			existNextPage = false;  
		System.out.println("existNextPage :" +existNextPage);
	//	전체레코드수 : 19 , 페이지당 레코드수 : 10, 현재 페이지 : 2, 전체레코드수 - 페이지당 레코드수 * 현재페이지 > 0 ? true : false  
	//	existNextPage = ( end * getRecordSize() ) < totalRecordCount; // 다음 페이지 존재여부
	}

	public void calculation_cur(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
		totalPageCount = ((totalRecordCount - 1) / getRecordSize()) +1; // 전체 페이지 수
		//현재 페이지 번호가 전체 페이지 수보다 큰 경우, 현재 페이지에 전체 페이지 수 저장
		if(getCurPage() > totalPageCount) {
			setCurPage(totalPageCount);
		}
		
		startPage = ( (getCurPage()-1) / getPageSize() ) * getPageSize() + 1;		//첫 페이지 번호
		endPage = startPage + getPageSize() - 1; 	// 끝 페이지 번호
		
		if(endPage > totalPageCount) { endPage = totalPageCount; }
		
		limitStart = (getCurPage()-1) * getRecordSize(); // limit 시작 위치 계산
		 // 이전 페이지 존재여부 existPrevPage  = start != 1 
		curPage = limitStart + curPage;
		
		if(startPage == 1)
			existPrevPage = false;		
		else
			existPrevPage = true; 
		
		existNextPage = ( endPage * getRecordSize() ) < totalRecordCount; // 다음 페이지 존재여부
	}
	
	public String getKeywordSearch() {
		return keywordSearch;
	}

	public void setKeywordSearch(String keywordSearch) {
		this.keywordSearch = keywordSearch;
	}
	
	public String getCurrentAddress() {
		return currentAddress;
	}
	
	public void setCurrentAddress(String currentAddress) {
		this.currentAddress = currentAddress;
	}
	
	public int getTotalPageCount() {
		return totalPageCount;
	}
	
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	
	public int getOffset() { // getOffset() == getStart() 
		return (page - 1) * recordSize;
	}
	
	public int getRecordSize() {
		return recordSize;
	}

	public void setRecordSize(int recordSize) {
		this.recordSize = recordSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
	public int getLimitStart() {
		return limitStart;
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
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

	public void setStartEndPage() {
		startPage = 1 + (curPage - 1) * 10;
		endPage = curPage * 10;
	}
	///////////////////////////////////////////////////////////////////////
	public void setStartEnd() {
		//page별로 start, end값만 구해주면 됨.
		start = 1 + (page - 1) * 10; 
		//무조건 1부터 시작
		//1page: 1 + 0 * 10 => start 1
		//2page: 1 + 1 * 10 => start 11  
		end = page * 10;
		//1page: 1 * 10 => end 10
		//2page: 2 * 10 => end 20
	}
   ////////////////////////////////////////////////////////////////////////////
	@Override
	public String toString() {
		return "PageVO [start=" + start + ", end=" + end + ", page=" + page + ", totalRecordCount=" + totalRecordCount
				+ ", totalPageCount=" + totalPageCount + ", limitStart=" + limitStart + ", existPrevPage="
				+ existPrevPage + ", existNextPage=" + existNextPage + ", recordSize=" + recordSize + ", pageSize="
				+ pageSize + "]";
	}

}

