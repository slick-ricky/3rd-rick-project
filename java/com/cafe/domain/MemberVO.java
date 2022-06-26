package com.cafe.domain;

import java.util.Date;

public class MemberVO {

	private String id;
	private String pw;
	private String names;
	private String email;
	private String tel;
	private String signdate;
	private int point;
	private String level;
	private String delmember;
	private String login_date;
	private String today;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
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
	public String getSigndate() {
		return signdate;
	}
	public void setSigndate(String signdate) {
		this.signdate = signdate;
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
	
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", names=" + names + ", email=" + email + ", tel=" + tel
				+ ", signdate=" + signdate + ", point=" + point + ", level=" + level + ", delmember=" + delmember
				+ ", login_date=" + login_date + ", today=" + today + "]";
	}
	
	
}
