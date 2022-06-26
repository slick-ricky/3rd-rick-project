package com.cafe.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount; // �� �Խù� ��
	private int startPage; // ���� ������
	private int endPage; // �� ������
	private boolean prev; // ���� ��ũ
	private boolean next; // ���� ��ũ
	private int displayPageNum = 5; //�� ����
	private Criteria cri; // limit �޼ҵ� �̿�

	private String code;

	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		//endPage�� ���ϰ� startPage�� ���ϴ°� ���⼭�� �� ���ϴ�.
		//endPage = ���� ������ ��ȣ / �� ���� * �� ����
		//���� �������� 3 : Math.ceil(3/10) * 10 = 10
		//���� �������� 1 : Math.ceil(1/10) * 10 = 10
		//���� �������� 20 : Math.ceil(20/10) * 10 = 20
		//���� �������� 21 : Math.ceil(21/10) * 10 = 30	
		startPage = (endPage - displayPageNum) + 1;
		//���� �������� 21 : startPage = (30 - 10) + 1 = 21
		// ������ ���� ��� ��� ó��
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true; //���� �������� 1�� �ƴ϶�� true
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
		//endPage = 10 , perPageNum = 10 , totalCount = 101 �̶�� next = true �Ǿ�� �Ѵ�.
	}
	
	public int getTotalCount() {

		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;	
		//�� �޼ҵ� ȣ��
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
	
	// get��� - url �ּ� ���� �� - ó�� �����ϰ�..
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
			.queryParam("page", page)
			.queryParam("perPageNum", cri.getPerPageNum())
			.build();
		return uriComponents.toUriString();
	}
	
	// search �߰�
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
