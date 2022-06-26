package com.cafe.domain;

public class BoardSelectDTO {

	private String code;
	private String gongji;
	private String names;
	private String signdate;
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getGongji() {
		return gongji;
	}
	public void setGongji(String gongji) {
		this.gongji = gongji;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public String getSigndate() {
		return signdate;
	}
	public void setSigndate(String signdate) {
		this.signdate = signdate;
	}
	
	
	@Override
	public String toString() {
		return "BoardSelectDTO [code=" + code + ", gongji=" + gongji + ", names=" + names + ", signdate=" + signdate
				+ "]";
	}
	
	
}
