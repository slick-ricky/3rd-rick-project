package com.cafe.domain;

import java.util.List;

public class TotalPrice2VO {

	private int totalPrice;
	private int deliveryPrice;
	
	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getDeliveryPrice() {
		return deliveryPrice;
	}

	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}

	@Override
	public String toString() {
		return "TotalPrice2VO [totalPrice=" + totalPrice + ", deliveryPrice=" + deliveryPrice + "]";
	}
	
	public TotalPrice2VO getTotal(CartVO vo) {
		TotalPrice2VO tp = new TotalPrice2VO();
		
		int aa = 0;
		int bb = 0;
		

		aa = vo.getOd_price();
		
		if(aa >= 20000) {
			bb = 0;
		}else if(aa > 0 && aa < 20000) {
			bb = 3000;
		}
		
		tp.setTotalPrice(aa);
		tp.setDeliveryPrice(bb);
		return tp;
	}
}
