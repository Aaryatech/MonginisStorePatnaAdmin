package com.ats.tril.model.doc;

import java.util.Date;

public class GatepassReportDetail {
		
	
	private int gpDetailId;
	private int gpId;
	private int gpItemId;
	private float gpQty;
	private int gpNoDays;
	private String gpReturnDate;
	private int gpStatus;
	private int isUsed;
	private float gpRemQty;
	private float gpRetQty;
	private String remark;
	private String itemCode;
	private String itemDesc;
	private String itemUom;
	
	
		
	public int getGpDetailId() {
		return gpDetailId;
	}
	public void setGpDetailId(int gpDetailId) {
		this.gpDetailId = gpDetailId;
	}
	public int getGpId() {
		return gpId;
	}
	public void setGpId(int gpId) {
		this.gpId = gpId;
	}
	public int getGpItemId() {
		return gpItemId;
	}
	public void setGpItemId(int gpItemId) {
		this.gpItemId = gpItemId;
	}
	public float getGpQty() {
		return gpQty;
	}
	public void setGpQty(float gpQty) {
		this.gpQty = gpQty;
	}
	public int getGpNoDays() {
		return gpNoDays;
	}
	public void setGpNoDays(int gpNoDays) {
		this.gpNoDays = gpNoDays;
	}
	public String getGpReturnDate() {
		return gpReturnDate;
	}
	public void setGpReturnDate(String gpReturnDate) {
		this.gpReturnDate = gpReturnDate;
	}
	public int getGpStatus() {
		return gpStatus;
	}
	public void setGpStatus(int gpStatus) {
		this.gpStatus = gpStatus;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	public float getGpRemQty() {
		return gpRemQty;
	}
	public void setGpRemQty(float gpRemQty) {
		this.gpRemQty = gpRemQty;
	}
	public float getGpRetQty() {
		return gpRetQty;
	}
	public void setGpRetQty(float gpRetQty) {
		this.gpRetQty = gpRetQty;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public String getItemUom() {
		return itemUom;
	}
	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}
	
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "GatepassReportDetail [gpDetailId=" + gpDetailId + ", gpId=" + gpId + ", gpItemId=" + gpItemId
				+ ", gpQty=" + gpQty + ", gpNoDays=" + gpNoDays + ", gpReturnDate=" + gpReturnDate + ", gpStatus="
				+ gpStatus + ", isUsed=" + isUsed + ", gpRemQty=" + gpRemQty + ", gpRetQty=" + gpRetQty + ", remark="
				+ remark + ", itemCode=" + itemCode + ", itemDesc=" + itemDesc + ", itemUom=" + itemUom + "]";
	}
	
	

}
