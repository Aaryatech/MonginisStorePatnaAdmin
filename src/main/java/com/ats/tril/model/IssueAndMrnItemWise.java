package com.ats.tril.model;
 
public class IssueAndMrnItemWise {
	
	 
	private int itemId; 
	private String itemCode; 
	private float approveQty; 
	private float approvedQtyValue; 
	private float approvedLandingValue; 
	private float issueQty; 
	private float issueQtyValue; 
	private float issueLandingValue;
	
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
		return "IssueAndMrnItemWise [itemId=" + itemId + ", itemCode=" + itemCode + ", approveQty=" + approveQty
				+ ", approvedQtyValue=" + approvedQtyValue + ", approvedLandingValue=" + approvedLandingValue
				+ ", issueQty=" + issueQty + ", issueQtyValue=" + issueQtyValue + ", issueLandingValue="
				+ issueLandingValue + "]";
	}
	

}
