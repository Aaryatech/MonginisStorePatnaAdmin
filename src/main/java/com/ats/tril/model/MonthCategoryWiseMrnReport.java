package com.ats.tril.model;
 

public class MonthCategoryWiseMrnReport {
	 
	private int sr; 
	private int catId; 
	private String catDesc; 
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
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getCatDesc() {
		return catDesc;
	}
	public void setCatDesc(String catDesc) {
		this.catDesc = catDesc;
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
		return "MonthCategoryWiseMrnReport [sr=" + sr + ", catId=" + catId + ", catDesc=" + catDesc + ", monthNo="
				+ monthNo + ", monthName=" + monthName + ", approveQty=" + approveQty + ", approvedQtyValue="
				+ approvedQtyValue + ", ApprovedLandingValue=" + ApprovedLandingValue + "]";
	}
	
	

}
