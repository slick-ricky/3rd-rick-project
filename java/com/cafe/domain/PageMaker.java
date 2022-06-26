package com.cafe.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount; // 총 게시물 수
	private int startPage; // 시작 페이지
	private int endPage; // 끝 페이지
	private boolean prev; // 이전 링크
	private boolean next; // 다음 링크
	private int displayPageNum = 5; //블럭 개수
	private Criteria cri; // limit 메소드 이용

	private String code;

	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		//endPage를 구하고 startPage를 구하는게 여기서는 더 편리하다.
		//endPage = 현재 페이지 번호 / 블럭 개수 * 블럭 개수
		//현재 페이지가 3 : Math.ceil(3/10) * 10 = 10
		//현재 페이지가 1 : Math.ceil(1/10) * 10 = 10
		//현재 페이지가 20 : Math.ceil(20/10) * 10 = 20
		//현재 페이지가 21 : Math.ceil(21/10) * 10 = 30	
		startPage = (endPage - displayPageNum) + 1;
		//현재 페이지가 21 : startPage = (30 - 10) + 1 = 21
		// 마지막 블럭일 경우 계산 처리
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true; //시작 페이지가 1이 아니라면 true
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
		//endPage = 10 , perPageNum = 10 , totalCount = 101 이라면 next = true 되어야 한다.
	}
	
	public int getTotalCount() {

		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;	
		//위 메소드 호출
		calcData();
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

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + ", code=" + code + "]";
	}
	
	// get방식 - url 주소 변수 값 - 처리 용이하게..
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
			.queryParam("page", page)
			.queryParam("perPageNum", cri.getPerPageNum())
			.build();
		return uriComponents.toUriString();
	}
	
	// search 추가
		public String makeSearch(int page) {
			UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("code", cri.getCode())
				.queryParam("searchType", ((SearchCriteria) cri).getSearchType())
				.queryParam("keyword", ((SearchCriteria) cri).getKeyword())
				
				//.queryParam("keyword", encoding(((SearchCriteria) cri).getKeyword()))
				.build();
			return uriComponents.toUriString();
		}
	
	
	
}
