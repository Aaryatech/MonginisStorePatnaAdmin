package com.ats.tril.model.indent;

import java.util.Date;

//Sachin's bean used on edit indent header and detail

public class GetIndentDetail {

	
	private int indDId;
	
	private int indMId;
	
	private String indMNo;
	
	private String indMDate;
	
	private int itemId;
	
	private float indQty;
	
	private String indItemUom;
	
	private String indItemDesc;
	
	private int indItemCurstk;
	
	private int indItemSchd;
	
	private String indItemSchddt;
	
	private String indRemark;

	private int indDStatus;
	
	private int delStatus;
	
	private float	indFyr;
	
	private String itemDesc;
	private String itemCode;
	private String itemUom;
	
	
	//transient/temp field
	
	int isDuplicate;
	
	
	
	public int getIsDuplicate() {
		return isDuplicate;
	}
	public void setIsDuplicate(int isDuplicate) {
		this.isDuplicate = isDuplicate;
	}
	public int getIndDId() {
		return indDId;
	}
	public int getIndMId() {
		return indMId;
	}
	public String getIndMNo() {
		return indMNo;
	}
	public String getIndMDate() {
		return indMDate;
	}
	public int getItemId() {
		return itemId;
	}
	public float getIndQty() {
		return indQty;
	}
	public String getIndItemUom() {
		return indItemUom;
	}
	public String getIndItemDesc() {
		return indItemDesc;
	}
	public int getIndItemCurstk() {
		return indItemCurstk;
	}
	public int getIndItemSchd() {
		return indItemSchd;
	}
	
	public String getIndRemark() {
		return indRemark;
	}
	public int getIndDStatus() {
		return indDStatus;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public float getIndFyr() {
		return indFyr;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public String getItemCode() {
		return itemCode;
	}
	public String getItemUom() {
		return itemUom;
	}
	public void setIndDId(int indDId) {
		this.indDId = indDId;
	}
	public void setIndMId(int indMId) {
		this.indMId = indMId;
	}
	public void setIndMNo(String indMNo) {
		this.indMNo = indMNo;
	}
	public void setIndMDate(String indMDate) {
		this.indMDate = indMDate;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public void setIndQty(float indQty) {
		this.indQty = indQty;
	}
	public void setIndItemUom(String indItemUom) {
		this.indItemUom = indItemUom;
	}
	public void setIndItemDesc(String indItemDesc) {
		this.indItemDesc = indItemDesc;
	}
	public void setIndItemCurstk(int indItemCurstk) {
		this.indItemCurstk = indItemCurstk;
	}
	public void setIndItemSchd(int indItemSchd) {
		this.indItemSchd = indItemSchd;
	}

	public void setIndRemark(String indRemark) {
		this.indRemark = indRemark;
	}
	public void setIndDStatus(int indDStatus) {
		this.indDStatus = indDStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	public void setIndFyr(float indFyr) {
		this.indFyr = indFyr;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}
	
	
	public String getIndItemSchddt() {
		return indItemSchddt;
	}
	public void setIndItemSchddt(String indItemSchddt) {
		this.indItemSchddt = indItemSchddt;
	}
	@Override
	public String toString() {
		return "GetIndentDetail [indDId=" + indDId + ", indMId=" + indMId + ", indMNo=" + indMNo + ", indMDate="
				+ indMDate + ", itemId=" + itemId + ", indQty=" + indQty + ", indItemUom=" + indItemUom
				+ ", indItemDesc=" + indItemDesc + ", indItemCurstk=" + indItemCurstk + ", indItemSchd=" + indItemSchd
				+ ", indItemSchddt=" + indItemSchddt + ", indRemark=" + indRemark + ", indDStatus=" + indDStatus
				+ ", delStatus=" + delStatus + ", indFyr=" + indFyr + ", itemDesc=" + itemDesc + ", itemCode="
				+ itemCode + ", itemUom=" + itemUom + "]";
	}
	
	
	
	
}
