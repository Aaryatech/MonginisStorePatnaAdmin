package com.ats.tril.model.getqueryitems;

public class GetRetNonRetQueryItem {
	
	
	private int gpDetailId;
	
	
	private int gpType;
	
	private String gpNo;
	
	private String gpDate;
	
	
	private String gpReturnDate;
	
	private float gpQty;
	
	private int gpStatus;
	
	
	private String reason ;//for remark;
	
	private String vendorCode;
	private String vendorName;
	
	private String itemDesc;
	private String itemCode;
	private String itemUom;
	public int getGpDetailId() {
		return gpDetailId;
	}
	public int getGpType() {
		return gpType;
	}
	public String getGpNo() {
		return gpNo;
	}
	public String getGpDate() {
		return gpDate;
	}
	public String getGpReturnDate() {
		return gpReturnDate;
	}
	public float getGpQty() {
		return gpQty;
	}
	public int getGpStatus() {
		return gpStatus;
	}
	public String getReason() {
		return reason;
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
	public void setGpDetailId(int gpDetailId) {
		this.gpDetailId = gpDetailId;
	}
	public void setGpType(int gpType) {
		this.gpType = gpType;
	}
	public void setGpNo(String gpNo) {
		this.gpNo = gpNo;
	}
	public void setGpDate(String gpDate) {
		this.gpDate = gpDate;
	}
	public void setGpReturnDate(String gpReturnDate) {
		this.gpReturnDate = gpReturnDate;
	}
	public void setGpQty(float gpQty) {
		this.gpQty = gpQty;
	}
	public void setGpStatus(int gpStatus) {
		this.gpStatus = gpStatus;
	}
	public void setReason(String reason) {
		this.reason = reason;
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
		return "GetRetNonRetQueryItem [gpDetailId=" + gpDetailId + ", gpType=" + gpType + ", gpNo=" + gpNo + ", gpDate="
				+ gpDate + ", gpReturnDate=" + gpReturnDate + ", gpQty=" + gpQty + ", gpStatus=" + gpStatus
				+ ", reason=" + reason + ", vendorCode=" + vendorCode + ", vendorName=" + vendorName + ", itemDesc="
				+ itemDesc + ", itemCode=" + itemCode + ", itemUom=" + itemUom + "]";
	}
	
	
	
	
	
	
	
	

}
