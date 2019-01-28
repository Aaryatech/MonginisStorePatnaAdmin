package com.ats.tril.model.getqueryitems;

public class GetRejMemoQueryItem {

	
	private int rejDetailId;
	
	private int rejNo;
	
	private int rejectionQty;
	
	public int getRejectionQty() {
		return rejectionQty;
	}
	public int getMemoQty() {
		return memoQty;
	}
	public void setRejectionQty(int rejectionQty) {
		this.rejectionQty = rejectionQty;
	}
	public void setMemoQty(int memoQty) {
		this.memoQty = memoQty;
	}
	private int memoQty;
	
	private String rejectionDate;
	
	private String vendorCode;
	private String vendorName;
	
	private String itemDesc;
	private String itemCode;
	private String itemUom;
	
	
	public int getRejDetailId() {
		return rejDetailId;
	}
	public int getRejNo() {
		return rejNo;
	}
	
	public String getRejectionDate() {
		return rejectionDate;
	}
	public String getVendorCode() {
		return vendorCode;
	}
	public String getVendorName() {
		return vendorName;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public String getItemCode() {
		return itemCode;
	}
	public String getItemUom() {
		return itemUom;
	}
	public void setRejDetailId(int rejDetailId) {
		this.rejDetailId = rejDetailId;
	}
	public void setRejNo(int rejNo) {
		this.rejNo = rejNo;
	}
	public void setRejectionDate(String rejectionDate) {
		this.rejectionDate = rejectionDate;
	}
	public void setVendorCode(String vendorCode) {
		this.vendorCode = vendorCode;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}
	@Override
	public String toString() {
		return "GetRejMemoQueryItem [rejDetailId=" + rejDetailId + ", rejNo=" + rejNo + ", rejectionQty=" + rejectionQty
				+ ", memoQty=" + memoQty + ", rejectionDate=" + rejectionDate + ", vendorCode=" + vendorCode
				+ ", vendorName=" + vendorName + ", itemDesc=" + itemDesc + ", itemCode=" + itemCode + ", itemUom="
				+ itemUom + "]";
	}
	
	
}
