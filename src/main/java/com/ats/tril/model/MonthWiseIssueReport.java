package com.ats.tril.model;
 

public class MonthWiseIssueReport {
	 
	private int sr; 
	private int deptId; 
	private String deptCode; 
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
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
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
		return "MonthWiseIssueReport [sr=" + sr + ", deptId=" + deptId + ", deptCode=" + deptCode + ", monthNo="
				+ monthNo + ", monthName=" + monthName + ", issueQty=" + issueQty + ", issueQtyValue=" + issueQtyValue
				+ ", issueLandingValue=" + issueLandingValue + "]";
	}
	
	

}
