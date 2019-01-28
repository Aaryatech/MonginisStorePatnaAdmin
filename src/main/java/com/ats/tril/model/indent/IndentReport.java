package com.ats.tril.model.indent;

import java.util.Date;

public class IndentReport {

	private int indMId;

	private String indMNo;

	private String indMDate;

	private int indMType;

	private int catId;

	private int achdId;

	private int indIsmonthly;

	private int indMStatus;

	private int indIsdev;

	private int deptId;

	private int subDeptId;

	private int noOfDays;

	private String catDesc;

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

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public int getAchdId() {
		return achdId;
	}

	public void setAchdId(int achdId) {
		this.achdId = achdId;
	}

	public int getIndIsmonthly() {
		return indIsmonthly;
	}

	public void setIndIsmonthly(int indIsmonthly) {
		this.indIsmonthly = indIsmonthly;
	}

	public int getIndMStatus() {
		return indMStatus;
	}

	public void setIndMStatus(int indMStatus) {
		this.indMStatus = indMStatus;
	}

	public int getIndIsdev() {
		return indIsdev;
	}

	public void setIndIsdev(int indIsdev) {
		this.indIsdev = indIsdev;
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

	public int getNoOfDays() {
		return noOfDays;
	}

	public void setNoOfDays(int noOfDays) {
		this.noOfDays = noOfDays;
	}

	public String getCatDesc() {
		return catDesc;
	}

	public void setCatDesc(String catDesc) {
		this.catDesc = catDesc;
	}

	@Override
	public String toString() {
		return "IndentReport [indMId=" + indMId + ", indMNo=" + indMNo + ", indMDate=" + indMDate + ", indMType="
				+ indMType + ", catId=" + catId + ", achdId=" + achdId + ", indIsmonthly=" + indIsmonthly
				+ ", indMStatus=" + indMStatus + ", indIsdev=" + indIsdev + ", deptId=" + deptId + ", subDeptId="
				+ subDeptId + ", noOfDays=" + noOfDays + ", catDesc=" + catDesc + "]";
	}

}
