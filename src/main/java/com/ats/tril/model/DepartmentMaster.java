package com.ats.tril.model;
 

public class DepartmentMaster {
	 
	private int deptId; 
	private String deptCode; 
	private String deptName; 
	private int isActive; 
	private int exInt1; 
	private int exInt2; 
	private String exVarchar; 
	private String exVarchar2;  
	private int exBool; 
	private int delStatus;
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public int getExInt1() {
		return exInt1;
	}
	public void setExInt1(int exInt1) {
		this.exInt1 = exInt1;
	}
	public int getExInt2() {
		return exInt2;
	}
	public void setExInt2(int exInt2) {
		this.exInt2 = exInt2;
	}
	public String getExVarchar() {
		return exVarchar;
	}
	public void setExVarchar(String exVarchar) {
		this.exVarchar = exVarchar;
	}
	public String getExVarchar2() {
		return exVarchar2;
	}
	public void setExVarchar2(String exVarchar2) {
		this.exVarchar2 = exVarchar2;
	}
	public int getExBool() {
		return exBool;
	}
	public void setExBool(int exBool) {
		this.exBool = exBool;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	@Override
	public String toString() {
		return "DepartmentMaster [deptId=" + deptId + ", deptCode=" + deptCode + ", deptName=" + deptName
				+ ", isActive=" + isActive + ", exInt1=" + exInt1 + ", exInt2=" + exInt2 + ", exVarchar=" + exVarchar
				+ ", exVarchar2=" + exVarchar2 + ", exBool=" + exBool + ", delStatus=" + delStatus + "]";
	}
	
	

}
