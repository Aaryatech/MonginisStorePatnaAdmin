package com.ats.tril.model.indent;
 

public class GetIntendDetail {
	 
	private int indDId; 
	private int indMId; 
	private String indMNo; 
	private String indMDate; 
	private int itemId; 
	private String itemCode; 
	private float indQty; 
	private String indItemUom; 
	private String indItemDesc; 
	private int indItemCurstk; 
	private int indItemSchd; 
	private String indItemSchddt; 
	private String indRemark; 
	private int delStatus;
	private int indDStatus; 
	private String indApr1Date; 
	private String indApr2Date;
	private float	indFyr;
	private float	poQty;
	private float	pendingQty;
	private float disc;
	private float rate;
	private float taxPer;
	private String stateCode;
	
	public float getPendingQty() {
		return pendingQty;
	}
	public void setPendingQty(float pendingQty) {
		this.pendingQty = pendingQty;
	}
	public float getPoQty() {
		return poQty;
	}
	public void setPoQty(float poQty) {
		this.poQty = poQty;
	}
	public int getIndDId() {
		return indDId;
	}
	public void setIndDId(int indDId) {
		this.indDId = indDId;
	}
	public int getIndMId() {
		return indMId;
	}
	public void setIndMId(int indMId) {
		this.indMId = indMId;
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
	public float getIndQty() {
		return indQty;
	}
	public void setIndQty(float indQty) {
		this.indQty = indQty;
	}
	public String getIndItemUom() {
		return indItemUom;
	}
	public void setIndItemUom(String indItemUom) {
		this.indItemUom = indItemUom;
	}
	public String getIndItemDesc() {
		return indItemDesc;
	}
	public void setIndItemDesc(String indItemDesc) {
		this.indItemDesc = indItemDesc;
	}
	public int getIndItemCurstk() {
		return indItemCurstk;
	}
	public void setIndItemCurstk(int indItemCurstk) {
		this.indItemCurstk = indItemCurstk;
	}
	public int getIndItemSchd() {
		return indItemSchd;
	}
	public void setIndItemSchd(int indItemSchd) {
		this.indItemSchd = indItemSchd;
	}
	public String getIndItemSchddt() {
		return indItemSchddt;
	}
	public void setIndItemSchddt(String indItemSchddt) {
		this.indItemSchddt = indItemSchddt;
	}
	public String getIndRemark() {
		return indRemark;
	}
	public void setIndRemark(String indRemark) {
		this.indRemark = indRemark;
	}
	public int getIndDStatus() {
		return indDStatus;
	}
	public void setIndDStatus(int indDStatus) {
		this.indDStatus = indDStatus;
	}
	public float getIndFyr() {
		return indFyr;
	}
	public void setIndFyr(float indFyr) {
		this.indFyr = indFyr;
	}
	
	public float getDisc() {
		return disc;
	}
	public void setDisc(float disc) {
		this.disc = disc;
	}
	
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	
	public String getIndApr1Date() {
		return indApr1Date;
	}
	public void setIndApr1Date(String indApr1Date) {
		this.indApr1Date = indApr1Date;
	}
	public String getIndApr2Date() {
		return indApr2Date;
	}
	public void setIndApr2Date(String indApr2Date) {
		this.indApr2Date = indApr2Date;
	}
	
	public float getTaxPer() {
		return taxPer;
	}
	public void setTaxPer(float taxPer) {
		this.taxPer = taxPer;
	}
	public String getStateCode() {
		return stateCode;
	}
	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}
	@Override
	public String toString() {
		return "GetIntendDetail [indDId=" + indDId + ", indMId=" + indMId + ", indMNo=" + indMNo + ", indMDate="
				+ indMDate + ", itemId=" + itemId + ", itemCode=" + itemCode + ", indQty=" + indQty + ", indItemUom="
				+ indItemUom + ", indItemDesc=" + indItemDesc + ", indItemCurstk=" + indItemCurstk + ", indItemSchd="
				+ indItemSchd + ", indItemSchddt=" + indItemSchddt + ", indRemark=" + indRemark + ", delStatus="
				+ delStatus + ", indDStatus=" + indDStatus + ", indApr1Date=" + indApr1Date + ", indApr2Date="
				+ indApr2Date + ", indFyr=" + indFyr + ", poQty=" + poQty + ", pendingQty=" + pendingQty + ", disc="
				+ disc + ", rate=" + rate + ", taxPer=" + taxPer + ", stateCode=" + stateCode + "]";
	}
	
	

}
