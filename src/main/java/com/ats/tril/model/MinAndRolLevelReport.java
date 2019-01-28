package com.ats.tril.model;
 

public class MinAndRolLevelReport {
	 
	private int itemId; 
	private String itemCode; 
	private float openingStock; 
	private float opStockValue; 
	private float approveQty; 
	private float approvedQtyValue; 
	private float approvedLandingValue; 
	private float issueQty; 
	private float issueQtyValue; 
	private float issueLandingValue; 
	private float returnIssueQty; 
	private float damageQty; 
	private float damagValue; 
	private float gatepassQty; 
	private float gatepassReturnQty; 
	private float itemMinLevel; 
	private float itemRodLevel;
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
	public float getOpeningStock() {
		return openingStock;
	}
	public void setOpeningStock(float openingStock) {
		this.openingStock = openingStock;
	}
	public float getOpStockValue() {
		return opStockValue;
	}
	public void setOpStockValue(float opStockValue) {
		this.opStockValue = opStockValue;
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
	public float getReturnIssueQty() {
		return returnIssueQty;
	}
	public void setReturnIssueQty(float returnIssueQty) {
		this.returnIssueQty = returnIssueQty;
	}
	public float getDamageQty() {
		return damageQty;
	}
	public void setDamageQty(float damageQty) {
		this.damageQty = damageQty;
	}
	public float getDamagValue() {
		return damagValue;
	}
	public void setDamagValue(float damagValue) {
		this.damagValue = damagValue;
	}
	public float getGatepassQty() {
		return gatepassQty;
	}
	public void setGatepassQty(float gatepassQty) {
		this.gatepassQty = gatepassQty;
	}
	public float getGatepassReturnQty() {
		return gatepassReturnQty;
	}
	public void setGatepassReturnQty(float gatepassReturnQty) {
		this.gatepassReturnQty = gatepassReturnQty;
	}
	public float getItemMinLevel() {
		return itemMinLevel;
	}
	public void setItemMinLevel(float itemMinLevel) {
		this.itemMinLevel = itemMinLevel;
	}
	public float getItemRodLevel() {
		return itemRodLevel;
	}
	public void setItemRodLevel(float itemRodLevel) {
		this.itemRodLevel = itemRodLevel;
	}
	@Override
	public String toString() {
		return "MinAndRolLevelReport [itemId=" + itemId + ", itemCode=" + itemCode + ", openingStock=" + openingStock
				+ ", opStockValue=" + opStockValue + ", approveQty=" + approveQty + ", approvedQtyValue="
				+ approvedQtyValue + ", approvedLandingValue=" + approvedLandingValue + ", issueQty=" + issueQty
				+ ", issueQtyValue=" + issueQtyValue + ", issueLandingValue=" + issueLandingValue + ", returnIssueQty="
				+ returnIssueQty + ", damageQty=" + damageQty + ", damagValue=" + damagValue + ", gatepassQty="
				+ gatepassQty + ", gatepassReturnQty=" + gatepassReturnQty + ", itemMinLevel=" + itemMinLevel
				+ ", itemRodLevel=" + itemRodLevel + "]";
	}
	
	

}
