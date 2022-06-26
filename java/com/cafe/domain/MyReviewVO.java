package com.cafe.domain;

public class MyReviewVO {

	private String it_name;
	private int od_group;
	private String date;
	private int score;
	private String satisfied;
	private String comment;
	private String file1;
	private String id;
	private String it_file;
	
	//멤버 조인
	private String names;
	
	//item 조인
	private int it_uid;
	private String it_category;
	private String it_new;
	private String it_season;
	
	//avg_score 조인
	private double avg_score;
	private int it_count;
	private String it_desc;
	public String getIt_name() {
		return it_name;
	}
	public void setIt_name(String it_name) {
		this.it_name = it_name;
	}
	public int getOd_group() {
		return od_group;
	}
	public void setOd_group(int od_group) {
		this.od_group = od_group;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getSatisfied() {
		return satisfied;
	}
	public void setSatisfied(String satisfied) {
		this.satisfied = satisfied;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIt_file() {
		return it_file;
	}
	public void setIt_file(String it_file) {
		this.it_file = it_file;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public int getIt_uid() {
		return it_uid;
	}
	public void setIt_uid(int it_uid) {
		this.it_uid = it_uid;
	}
	public String getIt_category() {
		return it_category;
	}
	public void setIt_category(String it_category) {
		this.it_category = it_category;
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
	public double getAvg_score() {
		return avg_score;
	}
	public void setAvg_score(double avg_score) {
		this.avg_score = avg_score;
	}
	public int getIt_count() {
		return it_count;
	}
	public void setIt_count(int it_count) {
		this.it_count = it_count;
	}
	public String getIt_desc() {
		return it_desc;
	}
	public void setIt_desc(String it_desc) {
		this.it_desc = it_desc;
	}
	@Override
	public String toString() {
		return "MyReviewVO [it_name=" + it_name + ", od_group=" + od_group + ", date=" + date + ", score=" + score
				+ ", satisfied=" + satisfied + ", comment=" + comment + ", file1=" + file1 + ", id=" + id + ", it_file="
				+ it_file + ", names=" + names + ", it_uid=" + it_uid + ", it_category=" + it_category + ", it_new="
				+ it_new + ", it_season=" + it_season + ", avg_score=" + avg_score + ", it_count=" + it_count
				+ ", it_desc=" + it_desc + "]";
	}
	
	

	

}
