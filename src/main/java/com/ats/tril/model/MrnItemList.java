package com.ats.tril.model;

public class MrnItemList {

	private int mrnDetailedId;
	private int mrnId;
	private float returnQty;
	private float pendingQty;
	private float approveQty;
	private int itemId;
	public int getMrnDetailedId() {
		return mrnDetailedId;
	}
	public void setMrnDetailedId(int mrnDetailedId) {
		this.mrnDetailedId = mrnDetailedId;
	}
	public int getMrnId() {
		return mrnId;
	}
	public void setMrnId(int mrnId) {
		this.mrnId = mrnId;
	}
	public float getReturnQty() {
		return returnQty;
	}
	public void setReturnQty(float returnQty) {
		this.returnQty = returnQty;
	}
	public float getPendingQty() {
		return pendingQty;
	}
	public void setPendingQty(float pendingQty) {
		this.pendingQty = pendingQty;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public float getApproveQty() {
		return approveQty;
	}
	public void setApproveQty(float approveQty) {
		this.approveQty = approveQty;
	}
	@Override
	public String toString() {
		return "MrnItemList [mrnDetailedId=" + mrnDetailedId + ", mrnId=" + mrnId + ", returnQty=" + returnQty
				+ ", pendingQty=" + pendingQty + ", approveQty=" + approveQty + ", itemId=" + itemId + "]";
	}
	
	 
	
}
