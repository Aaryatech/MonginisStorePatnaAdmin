package com.ats.tril.model;

import java.util.Date;

public class GetpassItem {

	private int gpItemId;

	private String itemName;

	private String itemDesc;

	private float itemCost;

	private String warrantyDate;

	private int isUsed;

	public int getGpItemId() {
		return gpItemId;
	}

	public void setGpItemId(int gpItemId) {
		this.gpItemId = gpItemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public float getItemCost() {
		return itemCost;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public void setItemCost(float itemCost) {
		this.itemCost = itemCost;
	}

	public String getWarrantyDate() {
		return warrantyDate;
	}

	public void setWarrantyDate(String warrantyDate) {
		this.warrantyDate = warrantyDate;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "GetpassItem [gpItemId=" + gpItemId + ", itemName=" + itemName + ", itemDesc=" + itemDesc + ", itemCost="
				+ itemCost + ", warrantyDate=" + warrantyDate + ", isUsed=" + isUsed + "]";
	}

}
