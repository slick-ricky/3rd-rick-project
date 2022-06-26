package com.cafe.domain;

import java.util.List;

public class TotalPriceVO {

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
		return "TotalPriceVO [totalPrice=" + totalPrice + ", deliveryPrice=" + deliveryPrice + "]";
	}
	
	public TotalPriceVO getTotal(List<CartVO> vo) {
		TotalPriceVO tp = new TotalPriceVO();
		
		int aa = 0;
		int bb = 0;
		int cc = 0;
		
		for(int i=0; i<vo.size(); i++) {
			if(vo.get(i).getChecked().equals("1")) {
				aa += vo.get(i).getOd_price();
			}
			if(vo.get(i).getChecked().equals("1") && vo.get(i).getOd_dvr().equals("N")) {
				bb = 0;
			}else if(vo.get(i).getChecked().equals("1") && vo.get(i).getOd_dvr().equals("Y")) {
				bb = 3000;
			}
		}
		
		if(aa >= 20000) {
			bb = 0;
		}
		
		tp.setTotalPrice(aa);
		tp.setDeliveryPrice(bb);
		return tp;
	}
}
