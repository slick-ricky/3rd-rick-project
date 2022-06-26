package com.cafe.domain;

public class OdrVO {

	private int od_uid; 
	private String od_date; 
	private String od_status;
	private int totalPay;
	private int cur_point;
	private String point_use2;
	private String exp_time;
	private String id;
	private String re_name; 
	private String re_zip;
	private String re_addr1;
	private String re_addr2;
	private String re_phone;
	private String re_rq;
	private String paybank;
	private String payway;
	private int tp_od;
	private int tp_dvr;
	private int it_uid;
	private int od_group;
	private int od_count;
	private String review;
	private String checked;

	//멤버 조인 컬럼
	private String names;
	private String email;
	private String tel;
	private int point;
	
	//카트 조인 컬럼
	private String od_num;
	private int od_price;
	private String od_dvr;
	private int od_amount;
	private String od_size;
	private String od_hot;
	private String od_request;
	
	//상품 조인 컬럼
	private String it_name;
	private String file1;
	
	//시간 조인 컬럼
	private String od_received;
	private String pay_done;
	private String delivering;
	private String dvr_done;
	private String od_cancel;
	private String it_refund;
	
	
	public int getOd_uid() {
		return od_uid;
	}
	public void setOd_uid(int od_uid) {
		this.od_uid = od_uid;
	}
	public String getOd_date() {
		return od_date;
	}
	public void setOd_date(String od_date) {
		this.od_date = od_date;
	}
	public String getOd_status() {
		return od_status;
	}
	public void setOd_status(String od_status) {
		this.od_status = od_status;
	}
	public int getTotalPay() {
		return totalPay;
	}
	public void setTotalPay(int totalPay) {
		this.totalPay = totalPay;
	}
	public int getCur_point() {
		return cur_point;
	}
	public void setCur_point(int cur_point) {
		this.cur_point = cur_point;
	}
	public String getPoint_use2() {
		return point_use2;
	}
	public void setPoint_use2(String point_use2) {
		this.point_use2 = point_use2;
	}
	public String getExp_time() {
		return exp_time;
	}
	public void setExp_time(String exp_time) {
		this.exp_time = exp_time;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRe_name() {
		return re_name;
	}
	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}
	public String getRe_zip() {
		return re_zip;
	}
	public void setRe_zip(String re_zip) {
		this.re_zip = re_zip;
	}
	public String getRe_addr1() {
		return re_addr1;
	}
	public void setRe_addr1(String re_addr1) {
		this.re_addr1 = re_addr1;
	}
	public String getRe_addr2() {
		return re_addr2;
	}
	public void setRe_addr2(String re_addr2) {
		this.re_addr2 = re_addr2;
	}
	public String getRe_phone() {
		return re_phone;
	}
	public void setRe_phone(String re_phone) {
		this.re_phone = re_phone;
	}
	public String getRe_rq() {
		return re_rq;
	}
	public void setRe_rq(String re_rq) {
		this.re_rq = re_rq;
	}
	public String getPaybank() {
		return paybank;
	}
	public void setPaybank(String paybank) {
		this.paybank = paybank;
	}
	public String getPayway() {
		return payway;
	}
	public void setPayway(String payway) {
		this.payway = payway;
	}
	public int getTp_od() {
		return tp_od;
	}
	public void setTp_od(int tp_od) {
		this.tp_od = tp_od;
	}
	public int getTp_dvr() {
		return tp_dvr;
	}
	public void setTp_dvr(int tp_dvr) {
		this.tp_dvr = tp_dvr;
	}
	public int getIt_uid() {
		return it_uid;
	}
	public void setIt_uid(int it_uid) {
		this.it_uid = it_uid;
	}
	public int getOd_group() {
		return od_group;
	}
	public void setOd_group(int od_group) {
		this.od_group = od_group;
	}
	public int getOd_count() {
		return od_count;
	}
	public void setOd_count(int od_count) {
		this.od_count = od_count;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
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
	public String getOd_num() {
		return od_num;
	}
	public void setOd_num(String od_num) {
		this.od_num = od_num;
	}
	public int getOd_price() {
		return od_price;
	}
	public void setOd_price(int od_price) {
		this.od_price = od_price;
	}
	public String getOd_dvr() {
		return od_dvr;
	}
	public void setOd_dvr(String od_dvr) {
		this.od_dvr = od_dvr;
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
	public String getIt_name() {
		return it_name;
	}
	public void setIt_name(String it_name) {
		this.it_name = it_name;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
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
	public String getDelivering() {
		return delivering;
	}
	public void setDelivering(String delivering) {
		this.delivering = delivering;
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
	
	
	@Override
	public String toString() {
		return "OdrVO [od_uid=" + od_uid + ", od_date=" + od_date + ", od_status=" + od_status + ", totalPay="
				+ totalPay + ", cur_point=" + cur_point + ", point_use2=" + point_use2 + ", exp_time=" + exp_time
				+ ", id=" + id + ", re_name=" + re_name + ", re_zip=" + re_zip + ", re_addr1=" + re_addr1
				+ ", re_addr2=" + re_addr2 + ", re_phone=" + re_phone + ", re_rq=" + re_rq + ", paybank=" + paybank
				+ ", payway=" + payway + ", tp_od=" + tp_od + ", tp_dvr=" + tp_dvr + ", it_uid=" + it_uid
				+ ", od_group=" + od_group + ", od_count=" + od_count + ", review=" + review + ", checked=" + checked
				+ ", names=" + names + ", email=" + email + ", tel=" + tel + ", point=" + point + ", od_num=" + od_num
				+ ", od_price=" + od_price + ", od_dvr=" + od_dvr + ", od_amount=" + od_amount + ", od_size=" + od_size
				+ ", od_hot=" + od_hot + ", od_request=" + od_request + ", it_name=" + it_name + ", file1=" + file1
				+ ", od_received=" + od_received + ", pay_done=" + pay_done + ", delivering=" + delivering
				+ ", dvr_done=" + dvr_done + ", od_cancel=" + od_cancel + ", it_refund=" + it_refund + "]";
	}
	
}
