package com.ats.tril.model;
 

public class MonthSubDeptWiseIssueReport {
	 
	private int sr; 
	private int subDeptId; 
	private String subDeptCode; 
	private int monthNo; 
	private String monthName; 
	private float issueQty; 
	private float issueQtyValue; 
	private float issueLandingValue;
	public int getSr() {
		return sr;
	}
	public void setSr(int sr) {
		this.sr = sr;
	}
	public int getSubDeptId() {
		return subDeptId;
	}
	public void setSubDeptId(int subDeptId) {
		this.subDeptId = subDeptId;
	}
	public String getSubDeptCode() {
		return subDeptCode;
	}
	public void setSubDeptCode(String subDeptCode) {
		this.subDeptCode = subDeptCode;
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
	public float getIssueQty() {
		return issueQty;
	}
	public void setIssueQty(float issueQty) {
		this.issueQty = issueQty;
	}
	public float getIssueQtyValue() {
		return issueQtyValue;
	}
	public void setIssueQtyValue(float issueQtyValue) {
		this.issueQtyValue = issueQtyValue;
	}
	public float getIssueLandingValue() {
		return issueLandingValue;
	}
	public void setIssueLandingValue(float issueLandingValue) {
		this.issueLandingValue = issueLandingValue;
	}
	@Override
	public String toString() {
		return "MonthSubDeptWiseIssueReport [sr=" + sr + ", subDeptId=" + subDeptId + ", subDeptCode=" + subDeptCode
				+ ", monthNo=" + monthNo + ", monthName=" + monthName + ", issueQty=" + issueQty + ", issueQtyValue="
				+ issueQtyValue + ", issueLandingValue=" + issueLandingValue + "]";
	}
	
	

}
