package com.cafe.domain;

public class CountDTO {

	private int p;
	private int a;
	private int b;
	private int c;
	
	private String od_date;

	
	
	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public int getA() {
		return a;
	}

	public void setA(int a) {
		this.a = a;
	}

	public int getB() {
		return b;
	}

	public void setB(int b) {
		this.b = b;
	}

	public int getC() {
		return c;
	}

	public void setC(int c) {
		this.c = c;
	}

	public String getOd_date() {
		return od_date;
	}

	public void setOd_date(String od_date) {
		this.od_date = od_date;
	}

	@Override
	public String toString() {
		return "CountDTO [p=" + p + ", a=" + a + ", b=" + b + ", c=" + c + ", od_date=" + od_date + "]";
	}
	
	
}
