package com.cafe.domain;

public class CartVO {

	private int ct_uid;
	private String ct_date;
	private	String id;
	private String names;
	private String it_uid;
	private int od_price;
	private int od_amount;
	private String od_size;
	private String od_hot;
	private String od_request;
	private String od_dvr;
	private int od_point;
	private String od_num;
	private String checked;
	private String dlt;
	private int od_group;
	
	private String rightnow;
		
	//ItemVO 일부 프로퍼티 조인 
	private String it_name;
	private String it_desc;
	private int it_price;
	private String file1;
	private int it_qty;
	
	//MemberVO 조인 컬럼
	private String email;
	private String tel;
	private int point;
	
	//OdrVO 조인 컬럼
	private String od_date;
	private int od_uid;
	private String od_status;
	private String exp_time;
	
	
	public int getCt_uid() {
		return ct_uid;
	}
	public void setCt_uid(int ct_uid) {
		this.ct_uid = ct_uid;
	}
	public String getCt_date() {
		return ct_date;
	}
	public void setCt_date(String ct_date) {
		this.ct_date = ct_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public String getIt_uid() {
		return it_uid;
	}
	public void setIt_uid(String it_uid) {
		this.it_uid = it_uid;
	}
	public int getOd_price() {
		return od_price;
	}
	public void setOd_price(int od_price) {
		this.od_price = od_price;
	}
	public int getOd_amount() {
		return od_amount;
	}
	public void setOd_amount(int od_amount) {
		this.od_amount = od_amount;
	}
	public String getOd_size() {
		return od_size;
	}
	public void setOd_size(String od_size) {
		this.od_size = od_size;
	}
	public String getOd_hot() {
		return od_hot;
	}
	public void setOd_hot(String od_hot) {
		this.od_hot = od_hot;
	}
	public String getOd_request() {
		return od_request;
	}
	public void setOd_request(String od_request) {
		this.od_request = od_request;
	}
	public String getOd_dvr() {
		return od_dvr;
	}
	public void setOd_dvr(String od_dvr) {
		this.od_dvr = od_dvr;
	}
	public int getOd_point() {
		return od_point;
	}
	public void setOd_point(int od_point) {
		this.od_point = od_point;
	}
	public String getOd_num() {
		return od_num;
	}
	public void setOd_num(String od_num) {
		this.od_num = od_num;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getDlt() {
		return dlt;
	}
	public void setDlt(String dlt) {
		this.dlt = dlt;
	}
	public int getOd_group() {
		return od_group;
	}
	public void setOd_group(int od_group) {
		this.od_group = od_group;
	}
	public String getRightnow() {
		return rightnow;
	}
	public void setRightnow(String rightnow) {
		this.rightnow = rightnow;
	}
	public String getIt_name() {
		return it_name;
	}
	public void setIt_name(String it_name) {
		this.it_name = it_name;
	}
	public String getIt_desc() {
		return it_desc;
	}
	public void setIt_desc(String it_desc) {
		this.it_desc = it_desc;
	}
	public int getIt_price() {
		return it_price;
	}
	public void setIt_price(int it_price) {
		this.it_price = it_price;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public int getIt_qty() {
		return it_qty;
	}
	public void setIt_qty(int it_qty) {
		this.it_qty = it_qty;
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
	public String getOd_date() {
		return od_date;
	}
	public void setOd_date(String od_date) {
		this.od_date = od_date;
	}
	public int getOd_uid() {
		return od_uid;
	}
	public void setOd_uid(int od_uid) {
		this.od_uid = od_uid;
	}
	public String getOd_status() {
		return od_status;
	}
	public void setOd_status(String od_status) {
		this.od_status = od_status;
	}
	public String getExp_time() {
		return exp_time;
	}
	public void setExp_time(String exp_time) {
		this.exp_time = exp_time;
	}
	
	
	
	@Override
	public String toString() {
		return "CartVO [ct_uid=" + ct_uid + ", ct_date=" + ct_date + ", id=" + id + ", names=" + names + ", it_uid="
				+ it_uid + ", od_price=" + od_price + ", od_amount=" + od_amount + ", od_size=" + od_size + ", od_hot="
				+ od_hot + ", od_request=" + od_request + ", od_dvr=" + od_dvr + ", od_point=" + od_point + ", od_num="
				+ od_num + ", checked=" + checked + ", dlt=" + dlt + ", od_group=" + od_group + ", rightnow=" + rightnow
				+ ", it_name=" + it_name + ", it_desc=" + it_desc + ", it_price=" + it_price + ", file1=" + file1
				+ ", it_qty=" + it_qty + ", email=" + email + ", tel=" + tel + ", point=" + point + ", od_date="
				+ od_date + ", od_uid=" + od_uid + ", od_status=" + od_status + ", exp_time=" + exp_time + "]";
	}
	
	
} 
