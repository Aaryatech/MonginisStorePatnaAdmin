package com.ats.tril.model;
 

public class IssueAndMrnGroupWise {
	 
	private int grpId; 
	private String grpCode; 
	private float approveQty; 
	private float approvedQtyValue; 
	private float approvedLandingValue; 
	private float issueQty; 
	private float issueQtyValue; 
	private float issueLandingValue;
	
	public int getGrpId() {
		return grpId;
	}
	public void setGrpId(int grpId) {
		this.grpId = grpId;
	}
	public String getGrpCode() {
		return grpCode;
	}
	public void setGrpCode(String grpCode) {
		this.grpCode = grpCode;
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
		return approvedLandingValue;
	}
	public void setApprovedLandingValue(float approvedLandingValue) {
		this.approvedLandingValue = approvedLandingValue;
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
		return "IssueAndMrnGroupWise [grpId=" + grpId + ", grpCode=" + grpCode + ", approveQty=" + approveQty
				+ ", approvedQtyValue=" + approvedQtyValue + ", approvedLandingValue=" + approvedLandingValue
				+ ", issueQty=" + issueQty + ", issueQtyValue=" + issueQtyValue + ", issueLandingValue="
				+ issueLandingValue + "]";
	}
	

}
