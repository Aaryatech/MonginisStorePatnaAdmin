package com.ats.tril.model;
 

public class ItemExpectedReport {
	 
	private int poDetailId; 
	private int poId; 
	private int itemId; 
	private float itemQty; 
	private String uom; 
	private String schDate; 
	private String poNo; 
	private String poDate; 
	private int vendId; 
	private String itemCode;  
	private String itemDesc; 
	private String vendorCode; 
	private String vendorName;
	public int getPoDetailId() {
		return poDetailId;
	}
	public void setPoDetailId(int poDetailId) {
		this.poDetailId = poDetailId;
	}
	public int getPoId() {
		return poId;
	}
	public void setPoId(int poId) {
		this.poId = poId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public float getItemQty() {
		return itemQty;
	}
	public void setItemQty(float itemQty) {
		this.itemQty = itemQty;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public String getSchDate() {
		return schDate;
	}
	public void setSchDate(String schDate) {
		this.schDate = schDate;
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
	@Override
	public String toString() {
		return "ItemExpectedReport [poDetailId=" + poDetailId + ", poId=" + poId + ", itemId=" + itemId + ", itemQty="
				+ itemQty + ", uom=" + uom + ", schDate=" + schDate + ", poNo=" + poNo + ", poDate=" + poDate
				+ ", vendId=" + vendId + ", itemCode=" + itemCode + ", itemDesc=" + itemDesc + ", vendorCode="
				+ vendorCode + ", vendorName=" + vendorName + "]";
	}
	
	

}
