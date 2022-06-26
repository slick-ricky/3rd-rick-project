package com.cafe.domain;

public class ItemVO {

	private int it_uid;
	private String it_name;
	private String it_category;
	private int it_price;
	private int it_point;
	private int it_qty;
	private String it_desc;
	private String it_date;
	private String it_new;
	private String it_season;
	private String file1;
	private String file2;
	private String file3;
	
	
	public int getIt_uid() {
		return it_uid;
	}
	public void setIt_uid(int it_uid) {
		this.it_uid = it_uid;
	}
	public String getIt_name() {
		return it_name;
	}
	public void setIt_name(String it_name) {
		this.it_name = it_name;
	}
	public String getIt_category() {
		return it_category;
	}
	public void setIt_category(String it_category) {
		this.it_category = it_category;
	}
	public int getIt_price() {
		return it_price;
	}
	public void setIt_price(int it_price) {
		this.it_price = it_price;
	}
	public int getIt_point() {
		return it_point;
	}
	public void setIt_point(int it_point) {
		this.it_point = it_point;
	}
	public int getIt_qty() {
		return it_qty;
	}
	public void setIt_qty(int it_qty) {
		this.it_qty = it_qty;
	}
	public String getIt_desc() {
		return it_desc;
	}
	public void setIt_desc(String it_desc) {
		this.it_desc = it_desc;
	}
	public String getIt_date() {
		return it_date;
	}
	public void setIt_date(String it_date) {
		this.it_date = it_date;
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
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile2() {
		return file2;
	}
	public void setFile2(String file2) {
		this.file2 = file2;
	}
	public String getFile3() {
		return file3;
	}
	public void setFile3(String file3) {
		this.file3 = file3;
	}
	
	@Override
	public String toString() {
		return "ItemVO [it_uid=" + it_uid + ", it_name=" + it_name + ", it_category=" + it_category + ", it_price="
				+ it_price + ", it_point=" + it_point + ", it_qty=" + it_qty + ", it_desc=" + it_desc + ", it_date="
				+ it_date + ", it_new=" + it_new + ", it_season=" + it_season + ", file1=" + file1 + ", file2=" + file2
				+ ", file3=" + file3 + "]";
	}

}
