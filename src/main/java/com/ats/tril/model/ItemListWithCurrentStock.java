package com.ats.tril.model;
 
public class ItemListWithCurrentStock {
	 
	private int itemId; 
	private String itemCode;  
	private int catId;   
	private int grpId;  
	private String itemUom;  
	private String itemDesc;  
	private float minLevel; 
	private float maxLevel;  
	private float rolLevel; 
	private float openingStock;  
	private float approveQty;  
	private float issueQty; 
	private float issueReturnQty; 
	private float damageQty; 
	private float poPending;  
	private float avgIssueQty;  
	private float clsQty;
	private float itemopQty; 
	private int active;
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
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public int getGrpId() {
		return grpId;
	}
	public void setGrpId(int grpId) {
		this.grpId = grpId;
	}
	public String getItemUom() {
		return itemUom;
	}
	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
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
	public float getIssueReturnQty() {
		return issueReturnQty;
	}
	public void setIssueReturnQty(float issueReturnQty) {
		this.issueReturnQty = issueReturnQty;
	}
	public float getDamageQty() {
		return damageQty;
	}
	public void setDamageQty(float damageQty) {
		this.damageQty = damageQty;
	}
	public float getPoPending() {
		return poPending;
	}
	public void setPoPending(float poPending) {
		this.poPending = poPending;
	}
	public float getAvgIssueQty() {
		return avgIssueQty;
	}
	public void setAvgIssueQty(float avgIssueQty) {
		this.avgIssueQty = avgIssueQty;
	}
	public float getClsQty() {
		return clsQty;
	}
	public void setClsQty(float clsQty) {
		this.clsQty = clsQty;
	}
	
	public float getMinLevel() {
		return minLevel;
	}
	public void setMinLevel(float minLevel) {
		this.minLevel = minLevel;
	}
	public float getMaxLevel() {
		return maxLevel;
	}
	public void setMaxLevel(float maxLevel) {
		this.maxLevel = maxLevel;
	}
	public float getRolLevel() {
		return rolLevel;
	}
	public void setRolLevel(float rolLevel) {
		this.rolLevel = rolLevel;
	}
	
	public float getItemopQty() {
		return itemopQty;
	}
	public void setItemopQty(float itemopQty) {
		this.itemopQty = itemopQty;
	}
	
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	@Override
	public String toString() {
		return "ItemListWithCurrentStock [itemId=" + itemId + ", itemCode=" + itemCode + ", catId=" + catId + ", grpId="
				+ grpId + ", itemUom=" + itemUom + ", itemDesc=" + itemDesc + ", minLevel=" + minLevel + ", maxLevel="
				+ maxLevel + ", rolLevel=" + rolLevel + ", openingStock=" + openingStock + ", approveQty=" + approveQty
				+ ", issueQty=" + issueQty + ", issueReturnQty=" + issueReturnQty + ", damageQty=" + damageQty
				+ ", poPending=" + poPending + ", avgIssueQty=" + avgIssueQty + ", clsQty=" + clsQty + ", itemopQty="
				+ itemopQty + ", active=" + active + "]";
	}
	
	
	 
}
