package com.cafe.domain;

public class ItemCountDTO {

	private int d;
	private int e;
	private String it_date;
	
	
	public int getD() {
		return d;
	}
	public void setD(int d) {
		this.d = d;
	}
	public int getE() {
		return e;
	}
	public void setE(int e) {
		this.e = e;
	}
	public String getIt_date() {
		return it_date;
	}
	public void setIt_date(String it_date) {
		this.it_date = it_date;
	}
	
	
	@Override
	public String toString() {
		return "ItemCountDTO [d=" + d + ", e=" + e + ", it_date=" + it_date + "]";
	}
	
	
}
