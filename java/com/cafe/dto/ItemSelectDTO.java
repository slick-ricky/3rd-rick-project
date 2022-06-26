package com.cafe.dto;

public class ItemSelectDTO {

	private String it_category;
	private Integer it_qty;
	private String it_new;
	private String it_season;
	private Integer it_price;
	
	
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
	
	
	@Override
	public String toString() {
		return "ItemSelectDTO [it_category=" + it_category + ", it_qty=" + it_qty + ", it_new=" + it_new
				+ ", it_season=" + it_season + ", it_price=" + it_price + "]";
	}
	
	
}
