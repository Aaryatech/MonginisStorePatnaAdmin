package com.ats.tril.model;

public class GetSubDept {
	
	
	private int subDeptId; 
	private int deptId; 
	private String deptDesc; 
	private String deptCode; 
	private String subDeptCode; 
	private String subDeptDesc; 
	private int isUsed; 
	private int createdIn; 
	private int deletedIn;
	public int getSubDeptId() {
		return subDeptId;
	}
	public void setSubDeptId(int subDeptId) {
		this.subDeptId = subDeptId;
	}
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public String getDeptDesc() {
		return deptDesc;
	}
	public void setDeptDesc(String deptDesc) {
		this.deptDesc = deptDesc;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getSubDeptCode() {
		return subDeptCode;
	}
	public void setSubDeptCode(String subDeptCode) {
		this.subDeptCode = subDeptCode;
	}
	public String getSubDeptDesc() {
		return subDeptDesc;
	}
	public void setSubDeptDesc(String subDeptDesc) {
		this.subDeptDesc = subDeptDesc;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	public int getCreatedIn() {
		return createdIn;
	}
	public void setCreatedIn(int createdIn) {
		this.createdIn = createdIn;
	}
	public int getDeletedIn() {
		return deletedIn;
	}
	public void setDeletedIn(int deletedIn) {
		this.deletedIn = deletedIn;
	}
	@Override
	public String toString() {
		return "GetSubDept [subDeptId=" + subDeptId + ", deptId=" + deptId + ", deptDesc=" + deptDesc + ", deptCode="
				+ deptCode + ", subDeptCode=" + subDeptCode + ", subDeptDesc=" + subDeptDesc + ", isUsed=" + isUsed
				+ ", createdIn=" + createdIn + ", deletedIn=" + deletedIn + "]";
	}

	
	
}
