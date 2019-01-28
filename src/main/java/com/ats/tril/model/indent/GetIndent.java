package com.ats.tril.model.indent;

import java.util.Date;


public class GetIndent {

	private int indMId;
	
	private String indMNo;
	
	private String indMDate;

	private int indMType;
	
	private String indRemark;
	
	private String indIsdev;
	
	private int indIsmonthly;

	private String catDesc;
	
	private int indMStatus;
	
	//
	
	private int achdId;
	
	private String accHeadDesc;
	
	private int catId;
	
	
	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public String getAccHeadDesc() {
		return accHeadDesc;
	}

	public void setAccHeadDesc(String accHeadDesc) {
		this.accHeadDesc = accHeadDesc;
	}

	public int getIndMId() {
		return indMId;
	}

	public String getIndMNo() {
		return indMNo;
	}

	

	public int getIndMType() {
		return indMType;
	}

	public String getIndIsdev() {
		return indIsdev;
	}

	public int getIndIsmonthly() {
		return indIsmonthly;
	}

	public String getCatDesc() {
		return catDesc;
	}

	public int getIndMStatus() {
		return indMStatus;
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

	public void setIndIsdev(String indIsdev) {
		this.indIsdev = indIsdev;
	}

	public void setIndIsmonthly(int indIsmonthly) {
		this.indIsmonthly = indIsmonthly;
	}

	public void setCatDesc(String catDesc) {
		this.catDesc = catDesc;
	}

	public void setIndMStatus(int indMStatus) {
		this.indMStatus = indMStatus;
	}

	public int getAchdId() {
		return achdId;
	}

	public void setAchdId(int achdId) {
		this.achdId = achdId;
	}
	private int deptId;
	private int subDeptId;



	public int getDeptId() {
		return deptId;
	}

	public int getSubDeptId() {
		return subDeptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public void setSubDeptId(int subDeptId) {
		this.subDeptId = subDeptId;
	}

	public String getIndRemark() {
		return indRemark;
	}

	public void setIndRemark(String indRemark) {
		this.indRemark = indRemark;
	}

	@Override
	public String toString() {
		return "GetIndent [indMId=" + indMId + ", indMNo=" + indMNo + ", indMDate=" + indMDate + ", indMType="
				+ indMType + ", indRemark=" + indRemark + ", indIsdev=" + indIsdev + ", indIsmonthly=" + indIsmonthly
				+ ", catDesc=" + catDesc + ", indMStatus=" + indMStatus + ", achdId=" + achdId + ", accHeadDesc="
				+ accHeadDesc + ", catId=" + catId + ", deptId=" + deptId + ", subDeptId=" + subDeptId + "]";
	}
	
}
