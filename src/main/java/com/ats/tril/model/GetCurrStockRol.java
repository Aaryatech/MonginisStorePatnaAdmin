package com.ats.tril.model;


public class GetCurrStockRol {
	
	private int itemId;

	private String itemCode;
	
	private String itemName;
	
	private String itemUom;
		
	private int catId;
	
	private float itemMaxLevel;
	
	private float itemMinLevel;
	
	private float openingStock;

	private float approveQty;

	private float issueQty;
	
	private float returnIssueQty;
	
	private float damageQty;
	
	private float gatepassQty;
	
	private float gatepassReturnQty;
	
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

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemUom() {
		return itemUom;
	}

	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public float getItemMaxLevel() {
		return itemMaxLevel;
	}

	public void setItemMaxLevel(float itemMaxLevel) {
		this.itemMaxLevel = itemMaxLevel;
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

	public float getItemMinLevel() {
		return itemMinLevel;
	}

	public void setItemMinLevel(float itemMinLevel) {
		this.itemMinLevel = itemMinLevel;
	}

	@Override
	public String toString() {
		return "GetCurrStockRol [itemId=" + itemId + ", itemCode=" + itemCode + ", itemName=" + itemName + ", itemUom="
				+ itemUom + ", catId=" + catId + ", itemMaxLevel=" + itemMaxLevel + ", itemMinLevel=" + itemMinLevel
				+ ", openingStock=" + openingStock + ", approveQty=" + approveQty + ", issueQty=" + issueQty
				+ ", returnIssueQty=" + returnIssueQty + ", damageQty=" + damageQty + ", gatepassQty=" + gatepassQty
				+ ", gatepassReturnQty=" + gatepassReturnQty + ", rolLevel=" + rolLevel + "]";
	}

	
	
}
