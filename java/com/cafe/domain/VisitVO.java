package com.cafe.domain;

public class VisitVO {

	private int uid;
	private String id;
	private String signdate;
	private String today;
	
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSigndate() {
		return signdate;
	}
	public void setSigndate(String signdate) {
		this.signdate = signdate;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	
	
	@Override
	public String toString() {
		return "VisitVO [uid=" + uid + ", id=" + id + ", signdate=" + signdate + ", today=" + today + "]";
	}
	
}
