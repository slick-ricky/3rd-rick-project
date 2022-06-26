package com.cafe.domain;

public class Criteria {

	private int page;
	private int perPageNum;

	//마이페이지 my_board
	private String code;
	private String id;
	
	//관리자 주문
	private String od_status;
	private String od_date;
	private Integer od_group;
	private String names;
	
	//관리자 게시판
	private String gongji;
	private String signdate;
	
	//관리자 item
	private String it_category;
	private Integer it_qty;
	private String it_new;
	private String it_season;
	private Integer it_price;
	
	//관리자 멤버
	private String pw;
	private String email;
	private String tel;
	private int point;
	private String level;
	private String delmember;
	private String login_date;
	private String today;
	
	//관리자 상품 리뷰
	private Integer score;
	

	public Criteria() { //첫페이지 실행시 적용될 값들
		this.page = 1;
		this.perPageNum = 10;
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}	
	
	public int getPage() {
		
		return page;
	}	

	//Mybatis SQL mapper - 			
	//sql 구문에서 limit ?,페이지당 출력 수 설정
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0) {
			this.perPageNum = 10;
			return; 
		}
		this.perPageNum = perPageNum;
	}	

	public int getPerPageNum() {
		
		return perPageNum;
	}

	//sql 구문에서 limit 시작 값,? ( 추가메서드 )
	public int getPageStart() {
		
		return (this.page - 1) * this.perPageNum;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getOd_status() {
		return od_status;
	}
	public void setOd_status(String od_status) {
		this.od_status = od_status;
	}
	public String getOd_date() {
		return od_date;
	}
	public void setOd_date(String od_date) {
		this.od_date = od_date;
	}
	public Integer getOd_group() {
		return od_group;
	}
	public void setOd_group(Integer od_group) {
		this.od_group = od_group;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public String getGongji() {
		return gongji;
	}
	public void setGongji(String gongji) {
		this.gongji = gongji;
	}
	public String getSigndate() {
		return signdate;
	}
	public void setSigndate(String signdate) {
		this.signdate = signdate;
	}
	public String getIt_category() {
		return it_category;
	}
	public void setIt_category(String it_category) {
		this.it_category = it_category;
	}
	public Integer getIt_qty() {
		return it_qty;
	}
	public void setIt_qty(Integer it_qty) {
		this.it_qty = it_qty;
	}
	public String getIt_new() {
		return it_new;
	}
	public void setIt_new(String it_new) {
		this.it_new = it_new;
	}
	public String getIt_season() {
		return it_season;
	}
	public void setIt_season(String it_season) {
		this.it_season = it_season;
	}
	public Integer getIt_price() {
		return it_price;
	}
	public void setIt_price(Integer it_price) {
		this.it_price = it_price;
	}

	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getDelmember() {
		return delmember;
	}
	public void setDelmember(String delmember) {
		this.delmember = delmember;
	}
	public String getLogin_date() {
		return login_date;
	}
	public void setLogin_date(String login_date) {
		this.login_date = login_date;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", code=" + code + ", id=" + id
				+ ", od_status=" + od_status + ", od_date=" + od_date + ", od_group=" + od_group + ", names=" + names
				+ ", gongji=" + gongji + ", signdate=" + signdate + ", it_category=" + it_category + ", it_qty="
				+ it_qty + ", it_new=" + it_new + ", it_season=" + it_season + ", it_price=" + it_price + ", pw=" + pw
				+ ", email=" + email + ", tel=" + tel + ", point=" + point + ", level=" + level + ", delmember="
				+ delmember + ", login_date=" + login_date + ", today=" + today + ", score=" + score + "]";
	}
	
}
