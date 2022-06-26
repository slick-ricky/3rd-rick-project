package com.cafe.domain;

public class ReviewSelectDTO {

	private String it_category;
	private Integer score;
	private String names;
	private String it_new;
	private String it_season;
	
	
	public String getIt_category() {
		return it_category;
	}
	public void setIt_category(String it_category) {
		this.it_category = it_category;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
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
	
	@Override
	public String toString() {
		return "ReviewSelectDTO [it_category=" + it_category + ", score=" + score + ", names=" + names + ", it_new="
				+ it_new + ", it_season=" + it_season + "]";
	}
	
	
	
}
