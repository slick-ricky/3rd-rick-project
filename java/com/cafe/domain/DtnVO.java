package com.cafe.domain;

public class DtnVO {
	
	private int uid;
	private String id;
	private String names;
	private String zip;
	private String addr1;
	private String addr2;
	private String tel;
	
	
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
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	@Override
	public String toString() {
		return "DtnVO [uid=" + uid + ", id=" + id + ", names=" + names + ", zip=" + zip + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", tel=" + tel + "]";
	}
	
	
}
