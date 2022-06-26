package com.cafe.domain;

public class OrderSelectDTO {

	private String od_status;
	private String od_date;
	private Integer od_group;
	private String names;
	
	
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
	
	
	@Override
	public String toString() {
		return "OrderSelectDTO [od_status=" + od_status + ", od_date=" + od_date + ", od_group=" + od_group + ", names="
				+ names + "]";
	}
	
	
}
