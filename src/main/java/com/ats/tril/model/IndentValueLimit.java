package com.ats.tril.model;
 

public class IndentValueLimit {
	 
	private int itemId; 
	private float qty; 
	private float rate;
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
	@Override
	public String toString() {
		return "IndentValueLimit [itemId=" + itemId + ", qty=" + qty + ", rate=" + rate + "]";
	}
	
	

}
