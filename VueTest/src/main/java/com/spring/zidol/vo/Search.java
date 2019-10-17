package com.spring.zidol.vo;

public class Search {

//	private String searchText;
//	
//	private int SearchCnt1;
//	private int SearchCnt2;
//	private int SearchCnt3;
	private String searchCondition;
	private String searchKeyWord;
	
	private String startDate;
	
	private String endDate;
	
	private int currentPage;
	private int perPage;
	private int totalCount;
	
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    
//	public String getSearchText() {
//		return searchText;
//	}
//	public void setSearchText(String searchText) {
//		this.searchText = searchText;
//	}
//	public int getSearchCnt1() {
//		return SearchCnt1;
//	}
//	public void setSearchCnt1(int searchCnt1) {
//		SearchCnt1 = searchCnt1;
//	}
//	public int getSearchCnt2() {
//		return SearchCnt2;
//	}
//	public void setSearchCnt2(int searchCnt2) {
//		SearchCnt2 = searchCnt2;
//	}
//	public int getSearchCnt3() {
//		return SearchCnt3;
//	}
//	public void setSearchCnt3(int searchCnt3) {
//		SearchCnt3 = searchCnt3;
//	}
    
	public String getStartDate() {
		return startDate;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyWord() {
		return searchKeyWord;
	}
	public void setSearchKeyWord(String searchKeyWord) {
		this.searchKeyWord = searchKeyWord;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		if (currentPage <= 0) {
            this.currentPage = 1;
            return;
        }

		this.currentPage = currentPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
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
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
    
    
}
