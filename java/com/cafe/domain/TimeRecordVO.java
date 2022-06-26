package com.cafe.domain;

public class TimeRecordVO {

	private String od_received;
	private String pay_done;
	private String dvr_done;
	private String od_cancel;
	private String it_refund;
	private int od_group;
	private String delivering;
	
	
	private String today;
	
	//odr ¡∂¿Œ
	private String id;

	public String getOd_received() {
		return od_received;
	}

	public void setOd_received(String od_received) {
		this.od_received = od_received;
	}

	public String getPay_done() {
		return pay_done;
	}

	public void setPay_done(String pay_done) {
		this.pay_done = pay_done;
	}

	public String getDvr_done() {
		return dvr_done;
	}

	public void setDvr_done(String dvr_done) {
		this.dvr_done = dvr_done;
	}

	public String getOd_cancel() {
		return od_cancel;
	}

	public void setOd_cancel(String od_cancel) {
		this.od_cancel = od_cancel;
	}

	public String getIt_refund() {
		return it_refund;
	}

	public void setIt_refund(String it_refund) {
		this.it_refund = it_refund;
	}

	public int getOd_group() {
		return od_group;
	}

	public void setOd_group(int od_group) {
		this.od_group = od_group;
	}

	public String getDelivering() {
		return delivering;
	}

	public void setDelivering(String delivering) {
		this.delivering = delivering;
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "TimeRecordVO [od_received=" + od_received + ", pay_done=" + pay_done + ", dvr_done=" + dvr_done
				+ ", od_cancel=" + od_cancel + ", it_refund=" + it_refund + ", od_group=" + od_group + ", delivering="
				+ delivering + ", today=" + today + ", id=" + id + "]";
	}
	
}
