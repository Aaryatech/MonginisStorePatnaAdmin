package com.ats.tril.model;

public class ImportExcelForPo {
	
	private int itemId;
	private float qty;
	private float rate;
	private int indDetailId;
	
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public float getQty() {
		return qty;
	}
	public void setQty(float qty) {
		this.qty = qty;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	
	public int getIndDetailId() {
		return indDetailId;
	}
	public void setIndDetailId(int indDetailId) {
		this.indDetailId = indDetailId;
	}
	@Override
	public String toString() {
		return "ImportExcelForPo [itemId=" + itemId + ", qty=" + qty + ", rate=" + rate + ", indDetailId=" + indDetailId
				+ "]";
	}
	
	
}
