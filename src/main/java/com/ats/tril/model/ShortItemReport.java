package com.ats.tril.model;
 

public class ShortItemReport {
	 
	private int poDetailId; 
	private String poNo; 
	private String poDate; 
	private int vendId; 
	private String vendorCode; 
	private String vendorName; 
	private int itemId; 
	private String itemCode;  
	private String itemDesc; 
	private float itemQty; 
	private float mrnQty; 
	private float pendingQty; 
	private String schDate;
	public int getPoDetailId() {
		return poDetailId;
	}
	public void setPoDetailId(int poDetailId) {
		this.poDetailId = poDetailId;
	}
	public String getPoNo() {
		return poNo;
	}
	public void setPoNo(String poNo) {
		this.poNo = poNo;
	}
	public String getPoDate() {
		return poDate;
	}
	public void setPoDate(String poDate) {
		this.poDate = poDate;
	}
	public int getVendId() {
		return vendId;
	}
	public void setVendId(int vendId) {
		this.vendId = vendId;
	}
	public String getVendorCode() {
		return vendorCode;
	}
	public void setVendorCode(String vendorCode) {
		this.vendorCode = vendorCode;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public float getItemQty() {
		return itemQty;
	}
	public void setItemQty(float itemQty) {
		this.itemQty = itemQty;
	}
	public float getMrnQty() {
		return mrnQty;
	}
	public void setMrnQty(float mrnQty) {
		this.mrnQty = mrnQty;
	}
	public float getPendingQty() {
		return pendingQty;
	}
	public void setPendingQty(float pendingQty) {
		this.pendingQty = pendingQty;
	}
	public String getSchDate() {
		return schDate;
	}
	public void setSchDate(String schDate) {
		this.schDate = schDate;
	}
	@Override
	public String toString() {
		return "ShortItemReport [poDetailId=" + poDetailId + ", poNo=" + poNo + ", poDate=" + poDate + ", vendId="
				+ vendId + ", vendorCode=" + vendorCode + ", vendorName=" + vendorName + ", itemId=" + itemId
				+ ", itemCode=" + itemCode + ", itemDesc=" + itemDesc + ", itemQty=" + itemQty + ", mrnQty=" + mrnQty
				+ ", pendingQty=" + pendingQty + ", schDate=" + schDate + "]";
	}

	
}
