package com.ats.tril.model;
 

public class MonthItemWiseMrnReport {
	 
	private int sr; 
	private int itemId; 
	private String itemCode; 
	private int monthNo; 
	private String monthName; 
	private float approveQty; 
	private float approvedQtyValue; 
	private float ApprovedLandingValue;
	public int getSr() {
		return sr;
	}
	public void setSr(int sr) {
		this.sr = sr;
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
	public int getMonthNo() {
		return monthNo;
	}
	public void setMonthNo(int monthNo) {
		this.monthNo = monthNo;
	}
	public String getMonthName() {
		return monthName;
	}
	public void setMonthName(String monthName) {
		this.monthName = monthName;
	}
	public float getApproveQty() {
		return approveQty;
	}
	public void setApproveQty(float approveQty) {
		this.approveQty = approveQty;
	}
	public float getApprovedQtyValue() {
		return approvedQtyValue;
	}
	public void setApprovedQtyValue(float approvedQtyValue) {
		this.approvedQtyValue = approvedQtyValue;
	}
	public float getApprovedLandingValue() {
		return ApprovedLandingValue;
	}
	public void setApprovedLandingValue(float approvedLandingValue) {
		ApprovedLandingValue = approvedLandingValue;
	}
	@Override
	public String toString() {
		return "MonthItemWiseMrnReport [sr=" + sr + ", itemId=" + itemId + ", itemCode=" + itemCode + ", monthNo="
				+ monthNo + ", monthName=" + monthName + ", approveQty=" + approveQty + ", approvedQtyValue="
				+ approvedQtyValue + ", ApprovedLandingValue=" + ApprovedLandingValue + "]";
	}
	
	

}
