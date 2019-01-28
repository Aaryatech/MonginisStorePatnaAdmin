package com.ats.tril.model.indent;

import java.util.List;

public class Indent {
	

	private int indMId;
	
	private String indMNo;
	
	private String indMDate;
	
	private int indMType;
	
	private int catId;
	
	private int achdId;
	
	private int indIsdev;
	
	private String indRemark;
	
	private int indIsmonthly;
	
	
	private int indMStatus;
	
	private int deptId;
	private int subDeptId;
	
	int delStatus;
	//new field 21 aug
		
		private String indApr1Date;
		
		private String indApr2Date;

	
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	List<IndentTrans> indentTrans;
	
	
	public int getIndMId() {
		return indMId;
	}
	public String getIndMNo() {
		return indMNo;
	}
	
	public int getIndMType() {
		return indMType;
	}
	public int getCatId() {
		return catId;
	}
	public int getAchdId() {
		return achdId;
	}
	public int getIndIsdev() {
		return indIsdev;
	}
	public String getIndRemark() {
		return indRemark;
	}
	public int getIndIsmonthly() {
		return indIsmonthly;
	}
	public int getIndMStatus() {
		return indMStatus;
	}
	public int getDeptId() {
		return deptId;
	}
	public int getSubDeptId() {
		return subDeptId;
	}
	public void setIndMId(int indMId) {
		this.indMId = indMId;
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
	public void setIndMType(int indMType) {
		this.indMType = indMType;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public void setAchdId(int achdId) {
		this.achdId = achdId;
	}
	public void setIndIsdev(int indIsdev) {
		this.indIsdev = indIsdev;
	}
	public void setIndRemark(String indRemark) {
		this.indRemark = indRemark;
	}
	public void setIndIsmonthly(int indIsmonthly) {
		this.indIsmonthly = indIsmonthly;
	}
	public void setIndMStatus(int indMStatus) {
		this.indMStatus = indMStatus;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public void setSubDeptId(int subDeptId) {
		this.subDeptId = subDeptId;
	}
	
	
	
	
	public List<IndentTrans> getIndentTrans() {
		return indentTrans;
	}
	public void setIndentTrans(List<IndentTrans> indentTrans) {
		this.indentTrans = indentTrans;
	}
	
	
	
	
	public String getIndApr1Date() {
		return indApr1Date;
	}
	public String getIndApr2Date() {
		return indApr2Date;
	}
	public void setIndApr1Date(String indApr1Date) {
		this.indApr1Date = indApr1Date;
	}
	public void setIndApr2Date(String indApr2Date) {
		this.indApr2Date = indApr2Date;
	}
	@Override
	public String toString() {
		return "Indent [indMId=" + indMId + ", indMNo=" + indMNo + ", indMDate=" + indMDate + ", indMType=" + indMType
				+ ", catId=" + catId + ", achdId=" + achdId + ", indIsdev=" + indIsdev + ", indRemark=" + indRemark
				+ ", indIsmonthly=" + indIsmonthly + ", indMStatus=" + indMStatus + ", deptId=" + deptId
				+ ", subDeptId=" + subDeptId + ", delStatus=" + delStatus + ", indApr1Date=" + indApr1Date
				+ ", indApr2Date=" + indApr2Date + ", indentTrans=" + indentTrans + "]";
	}
	
	
	
	
	
}
