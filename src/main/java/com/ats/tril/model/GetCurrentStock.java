package com.ats.tril.model;
 

public class GetCurrentStock {
	
	 
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
	private float opLandingValue; 
	private float damageLandingValue;
	private float rolLevel;
	
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
	public float getApproveQty() {
		return approveQty;
	}
	public void setApproveQty(float approveQty) {
		this.approveQty = approveQty;
	}
	public float getIssueQty() {
		return issueQty;
	}
	public void setIssueQty(float issueQty) {
		this.issueQty = issueQty;
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
	
	public float getRolLevel() {
		return rolLevel;
	}
	public void setRolLevel(float rolLevel) {
		this.rolLevel = rolLevel;
	}
	
	public float getOpStockValue() {
		return opStockValue;
	}
	public void setOpStockValue(float opStockValue) {
		this.opStockValue = opStockValue;
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
	public float getDamagValue() {
		return damagValue;
	}
	public void setDamagValue(float damagValue) {
		this.damagValue = damagValue;
	}
	
	public float getOpLandingValue() {
		return opLandingValue;
	}
	public void setOpLandingValue(float opLandingValue) {
		this.opLandingValue = opLandingValue;
	}
	public float getDamageLandingValue() {
		return damageLandingValue;
	}
	public void setDamageLandingValue(float damageLandingValue) {
		this.damageLandingValue = damageLandingValue;
	}
	@Override
	public String toString() {
		return "GetCurrentStock [itemId=" + itemId + ", itemCode=" + itemCode + ", openingStock=" + openingStock
				+ ", opStockValue=" + opStockValue + ", approveQty=" + approveQty + ", approvedQtyValue="
				+ approvedQtyValue + ", approvedLandingValue=" + approvedLandingValue + ", issueQty=" + issueQty
				+ ", issueQtyValue=" + issueQtyValue + ", issueLandingValue=" + issueLandingValue + ", returnIssueQty="
				+ returnIssueQty + ", damageQty=" + damageQty + ", damagValue=" + damagValue + ", gatepassQty="
				+ gatepassQty + ", gatepassReturnQty=" + gatepassReturnQty + ", opLandingValue=" + opLandingValue
				+ ", damageLandingValue=" + damageLandingValue + ", rolLevel=" + rolLevel + "]";
	}
	
	

}
