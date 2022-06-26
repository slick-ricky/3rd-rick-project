package com.cafe.domain;

import java.util.Arrays;

public class BoardVO {

	private int uid;
	private String subject;
	private String gongji;
	private String content;
	private String id;
	private String names;
	private String signdate;
	private int ref;
	private String file1;
	private String file2;
	private int fid;
	private String thread;
	private String[] files;
	
	
	//reply 조인
	private int uid_count;

	public int getUid_count() {
		return uid_count;
	}
	
	//코드
	private String code;

	
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getGongji() {
		return gongji;
	}

	public void setGongji(String gongji) {
		this.gongji = gongji;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getSigndate() {
		return signdate;
	}

	public void setSigndate(String signdate) {
		this.signdate = signdate;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
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

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getThread() {
		return thread;
	}

	public void setThread(String thread) {
		this.thread = thread;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setUid_count(int uid_count) {
		this.uid_count = uid_count;
	}

	@Override
	public String toString() {
		return "BoardVO [uid=" + uid + ", subject=" + subject + ", gongji=" + gongji + ", content=" + content + ", id="
				+ id + ", names=" + names + ", signdate=" + signdate + ", ref=" + ref + ", file1=" + file1 + ", file2="
				+ file2 + ", fid=" + fid + ", thread=" + thread + ", files=" + Arrays.toString(files) + ", uid_count="
				+ uid_count + ", code=" + code + "]";
	}

	
	
}
