package com.ats.tril.model.indent;

import java.util.Date;

public class TempIndentDetail {
	
	int itemId;
	String itemName;
	float qty;
	String uom;
	float curStock;
	int schDays;
	String date;
	
	String itemCode;
	
	String remark;
	
	int isDuplicate; //1 for yes 0 for no
	private float poPending;  
	private float avgIssueQty; 
	private float moqQty; 
	public int getIsDuplicate() {
		return isDuplicate;
	}

	public void setIsDuplicate(int isDuplicate) {
		this.isDuplicate = isDuplicate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getItemId() {
		return itemId;
	}
	
	public float getQty() {
		return qty;
	}
	public String getUom() {
		return uom;
	}
	public float getCurStock() {
		return curStock;
	}
	public int getSchDays() {
		return schDays;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public void setQty(float qty) {
		this.qty = qty;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public void setCurStock(float curStock) {
		this.curStock = curStock;
	}
	public void setSchDays(int schDays) {
		this.schDays = schDays;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
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

	public float getMoqQty() {
		return moqQty;
	}

	public void setMoqQty(float moqQty) {
		this.moqQty = moqQty;
	}

	@Override
	public String toString() {
		return "TempIndentDetail [itemId=" + itemId + ", itemName=" + itemName + ", qty=" + qty + ", uom=" + uom
				+ ", curStock=" + curStock + ", schDays=" + schDays + ", date=" + date + ", itemCode=" + itemCode
				+ ", remark=" + remark + ", isDuplicate=" + isDuplicate + ", poPending=" + poPending + ", avgIssueQty="
				+ avgIssueQty + ", moqQty=" + moqQty + "]";
	}

	
	
}
