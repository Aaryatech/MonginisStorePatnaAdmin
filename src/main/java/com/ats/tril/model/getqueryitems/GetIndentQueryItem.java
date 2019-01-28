package com.ats.tril.model.getqueryitems;



import com.fasterxml.jackson.annotation.JsonFormat;

public class GetIndentQueryItem {

	
	private int indDId;
	
	
	private String indMNo;
	
	private String indMDate;

	
	private int indMType;
	
	private String catDesc;

	private String deptCode;
	private String deptDesc;
	
	private String subDeptCode;
	private String subDeptDesc;
	
	private float indQty;
	
	private int indDStatus;
	
	
	private String itemDesc;
	private String itemCode;
	private String itemUom;
	public int getIndDId() {
		return indDId;
	}
	public String getIndMNo() {
		return indMNo;
	}
	@JsonFormat(locale = "hi",timezone = "Asia/Kolkata", pattern = "dd-MM-yyyy")

	public String getIndMDate() {
		return indMDate;
	}
	public int getIndMType() {
		return indMType;
	}
	public String getCatDesc() {
		return catDesc;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public String getDeptDesc() {
		return deptDesc;
	}
	public String getSubDeptCode() {
		return subDeptCode;
	}
	public String getSubDeptDesc() {
		return subDeptDesc;
	}
	public float getIndQty() {
		return indQty;
	}
	public int getIndDStatus() {
		return indDStatus;
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
	public void setIndMNo(String indMNo) {
		this.indMNo = indMNo;
	}
	public void setIndMDate(String indMDate) {
		this.indMDate = indMDate;
	}
	public void setIndMType(int indMType) {
		this.indMType = indMType;
	}
	public void setCatDesc(String catDesc) {
		this.catDesc = catDesc;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public void setDeptDesc(String deptDesc) {
		this.deptDesc = deptDesc;
	}
	public void setSubDeptCode(String subDeptCode) {
		this.subDeptCode = subDeptCode;
	}
	public void setSubDeptDesc(String subDeptDesc) {
		this.subDeptDesc = subDeptDesc;
	}
	public void setIndQty(float indQty) {
		this.indQty = indQty;
	}
	public void setIndDStatus(int indDStatus) {
		this.indDStatus = indDStatus;
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
	@Override
	public String toString() {
		return "GetIndentQueryItem [indDId=" + indDId + ", indMNo=" + indMNo + ", indMDate=" + indMDate + ", indMType="
				+ indMType + ", catDesc=" + catDesc + ", deptCode=" + deptCode + ", deptDesc=" + deptDesc
				+ ", subDeptCode=" + subDeptCode + ", subDeptDesc=" + subDeptDesc + ", indQty=" + indQty
				+ ", indDStatus=" + indDStatus + ", itemDesc=" + itemDesc + ", itemCode=" + itemCode + ", itemUom="
				+ itemUom + "]";
	}
	
	
	
	
	
	
	
}
