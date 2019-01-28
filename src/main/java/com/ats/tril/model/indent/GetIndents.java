package com.ats.tril.model.indent;

import java.util.List;


public class GetIndents {

	private int indMId;

	private String indMNo;
	
	private String indMDate;

	private int indMType;
	
	private String indIsdev;
	
	private int indIsmonthly;

	private String catDesc;
	
	private int achdId;
	
	private String accountHead;
	
	private int indMStatus;
	
	private int deptId;
	
	private int subDeptId;

	List<DashIndentDetails> dashIndentDetailList;
	
	

	public String getAccountHead() {
		return accountHead;
	}

	public void setAccountHead(String accountHead) {
		this.accountHead = accountHead;
	}

	public List<DashIndentDetails> getDashIndentDetailList() {
		return dashIndentDetailList;
	}

	public void setDashIndentDetailList(List<DashIndentDetails> dashIndentDetailList) {
		this.dashIndentDetailList = dashIndentDetailList;
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

	public int getIndMType() {
		return indMType;
	}

	public void setIndMType(int indMType) {
		this.indMType = indMType;
	}

	public String getIndIsdev() {
		return indIsdev;
	}

	public void setIndIsdev(String indIsdev) {
		this.indIsdev = indIsdev;
	}

	public int getIndIsmonthly() {
		return indIsmonthly;
	}

	public void setIndIsmonthly(int indIsmonthly) {
		this.indIsmonthly = indIsmonthly;
	}

	public String getCatDesc() {
		return catDesc;
	}

	public void setCatDesc(String catDesc) {
		this.catDesc = catDesc;
	}

	public int getAchdId() {
		return achdId;
	}

	public void setAchdId(int achdId) {
		this.achdId = achdId;
	}

	public int getIndMStatus() {
		return indMStatus;
	}

	public void setIndMStatus(int indMStatus) {
		this.indMStatus = indMStatus;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public int getSubDeptId() {
		return subDeptId;
	}

	public void setSubDeptId(int subDeptId) {
		this.subDeptId = subDeptId;
	}

	@Override
	public String toString() {
		return "GetIndents [indMId=" + indMId + ", indMNo=" + indMNo + ", indMDate=" + indMDate + ", indMType="
				+ indMType + ", indIsdev=" + indIsdev + ", indIsmonthly=" + indIsmonthly + ", catDesc=" + catDesc
				+ ", achdId=" + achdId + ", indMStatus=" + indMStatus + ", deptId=" + deptId + ", subDeptId="
				+ subDeptId + ", dashIndentDetailList=" + dashIndentDetailList + "]";
	}
    
}
