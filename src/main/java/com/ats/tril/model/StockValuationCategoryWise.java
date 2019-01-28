package com.ats.tril.model;
 
public class StockValuationCategoryWise {
	 
	private int catId; 
	private String catDesc; 
	private float openingStock; 
	private float opStockValue; 
	private float approveQty; 
	private float approvedQtyValue; 
	private float approvedLandingValue; 
	private float issueQty; 
	private float issueQtyValue;  
	private float issueLandingValue; 
	private float damageQty; 
	private float damageValue; 
	private float opLandingValue;  
	private float damageLandingValue;
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
	public float getDamageQty() {
		return damageQty;
	}
	public void setDamageQty(float damageQty) {
		this.damageQty = damageQty;
	}
	public float getDamageValue() {
		return damageValue;
	}
	public void setDamageValue(float damageValue) {
		this.damageValue = damageValue;
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
		return "StockValuationCategoryWise [catId=" + catId + ", catDesc=" + catDesc + ", openingStock=" + openingStock
				+ ", opStockValue=" + opStockValue + ", approveQty=" + approveQty + ", approvedQtyValue="
				+ approvedQtyValue + ", approvedLandingValue=" + approvedLandingValue + ", issueQty=" + issueQty
				+ ", issueQtyValue=" + issueQtyValue + ", issueLandingValue=" + issueLandingValue + ", damageQty="
				+ damageQty + ", damageValue=" + damageValue + ", opLandingValue=" + opLandingValue
				+ ", damageLandingValue=" + damageLandingValue + "]";
	}
	
	

}
