package com.ats.tril.model.getqueryitems;

public class GetEnquiryQueryItem {
	
	private int enqDetailId;
	
	private float enqQty;
	
	private String enqNo;
	
	private String enqDate;
	
	private String enqDetailDate;
	private String vendorCode;
	private String vendorName;
	
	private String itemDesc;
	private String itemCode;
	private String itemUom;
	
	
	
	public String getEnqNo() {
		return enqNo;
	}
	public void setEnqNo(String enqNo) {
		this.enqNo = enqNo;
	}
	public int getEnqDetailId() {
		return enqDetailId;
	}
	public float getEnqQty() {
		return enqQty;
	}	
	
	public String getEnqDate() {
		return enqDate;
	}
	
	public String getEnqDetailDate() {
		return enqDetailDate;
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
	public void setEnqDetailId(int enqDetailId) {
		this.enqDetailId = enqDetailId;
	}
	public void setEnqQty(float enqQty) {
		this.enqQty = enqQty;
	}
	public void setEnqDate(String enqDate) {
		this.enqDate = enqDate;
	}
	public void setEnqDetailDate(String enqDetailDate) {
		this.enqDetailDate = enqDetailDate;
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
		return "GetEnquiryQueryItem [enqDetailId=" + enqDetailId + ", enqQty=" + enqQty + ", enqNo=" + enqNo
				+ ", enqDate=" + enqDate + ", enqDetailDate=" + enqDetailDate + ", vendorCode=" + vendorCode
				+ ", vendorName=" + vendorName + ", itemDesc=" + itemDesc + ", itemCode=" + itemCode + ", itemUom="
				+ itemUom + "]";
	}
	
	
	
}
