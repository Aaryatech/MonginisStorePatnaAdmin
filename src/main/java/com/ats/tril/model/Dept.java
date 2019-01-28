package com.ats.tril.model;

public class Dept {
	
	private int deptId; 
	private String deptCode; 
	private String deptDesc; 
	private int isUsed; 
	private int deptCreatedIn; 
	private int deptDeletedIn;
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
	public String getDeptDesc() {
		return deptDesc;
	}
	public void setDeptDesc(String deptDesc) {
		this.deptDesc = deptDesc;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	public int getDeptCreatedIn() {
		return deptCreatedIn;
	}
	public void setDeptCreatedIn(int deptCreatedIn) {
		this.deptCreatedIn = deptCreatedIn;
	}
	public int getDeptDeletedIn() {
		return deptDeletedIn;
	}
	public void setDeptDeletedIn(int deptDeletedIn) {
		this.deptDeletedIn = deptDeletedIn;
	}
	@Override
	public String toString() {
		return "Dept [deptId=" + deptId + ", deptCode=" + deptCode + ", deptDesc=" + deptDesc + ", isUsed=" + isUsed
				+ ", deptCreatedIn=" + deptCreatedIn + ", deptDeletedIn=" + deptDeletedIn + "]";
	}
	
	

}
