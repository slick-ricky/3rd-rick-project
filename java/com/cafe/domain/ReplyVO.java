package com.cafe.domain;

import java.util.Date;

public class ReplyVO {

	private Integer rno;
	private Integer uid;
	private String replytext;
	private String replyer;
	private Date regdate;
	private Date updatedate;
	private String id;
	private String tb_name;
	
	
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTb_name() {
		return tb_name;
	}
	public void setTb_name(String tb_name) {
		this.tb_name = tb_name;
	}
	
	
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", uid=" + uid + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + ", id=" + id + ", tb_name=" + tb_name + "]";
	}
	
	

}