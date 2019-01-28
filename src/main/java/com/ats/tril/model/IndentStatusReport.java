package com.ats.tril.model;
 
public class IndentStatusReport {
	 
	private int sr; 
	private int indDId; 
	private String indMNo; 
	private String indMDate; 
	private int itemId; 
	private String itemCode;  
	private String indItemSchddt; 
	private String remark;
	private int excessDays;
	private float indQty;
	
	public int getSr() {
		return sr;
	}
	public void setSr(int sr) {
		this.sr = sr;
	}
	public int getIndDId() {
		return indDId;
	}
	public void setIndDId(int indDId) {
		this.indDId = indDId;
	}
	public String getIndMNo() {
		return indMNo;
	}
	public void setIndMNo(String indMNo) {
		this.indMNo = indMNo;
	}
	public String getIndMDate() {
		return indMDate;
	}
	public void setIndMDate(String indMDate) {
		this.indMDate = indMDate;
	}
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
	public String getIndItemSchddt() {
		return indItemSchddt;
	}
	public void setIndItemSchddt(String indItemSchddt) {
		this.indItemSchddt = indItemSchddt;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getExcessDays() {
		return excessDays;
	}
	public void setExcessDays(int excessDays) {
		this.excessDays = excessDays;
	}
	
	public float getIndQty() {
		return indQty;
	}
	public void setIndQty(float indQty) {
		this.indQty = indQty;
	}
	@Override
	public String toString() {
		return "IndentStatusReport [sr=" + sr + ", indDId=" + indDId + ", indMNo=" + indMNo + ", indMDate=" + indMDate
				+ ", itemId=" + itemId + ", itemCode=" + itemCode + ", indItemSchddt=" + indItemSchddt + ", remark="
				+ remark + ", excessDays=" + excessDays + ", indQty=" + indQty + "]";
	}
	
	

}
