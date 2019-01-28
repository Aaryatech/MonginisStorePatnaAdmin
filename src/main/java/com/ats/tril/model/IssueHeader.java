package com.ats.tril.model;

import java.util.List;
 

public class IssueHeader {
	 
	private int issueId; 
	private String issueNo; 
	private int itemCategory; 
	private String issueDate;  
	private int deptId; 
	private int subDeptId; 
	private int accHead;
	private int deleteStatus; 
	private int status; 
	private String issueSlipNo;
	List<IssueDetail> issueDetailList;
	
	public int getIssueId() {
		return issueId;
	}
	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}
	public String getIssueNo() {
		return issueNo;
	}
	public void setIssueNo(String issueNo) {
		this.issueNo = issueNo;
	}
	public int getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(int itemCategory) {
		this.itemCategory = itemCategory;
	}
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public int getDeleteStatus() {
		return deleteStatus;
	}
	public void setDeleteStatus(int deleteStatus) {
		this.deleteStatus = deleteStatus;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<IssueDetail> getIssueDetailList() {
		return issueDetailList;
	}
	public void setIssueDetailList(List<IssueDetail> issueDetailList) {
		this.issueDetailList = issueDetailList;
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
	public int getAccHead() {
		return accHead;
	}
	public void setAccHead(int accHead) {
		this.accHead = accHead;
	}
	
	public String getIssueSlipNo() {
		return issueSlipNo;
	}
	public void setIssueSlipNo(String issueSlipNo) {
		this.issueSlipNo = issueSlipNo;
	}
	@Override
	public String toString() {
		return "IssueHeader [issueId=" + issueId + ", issueNo=" + issueNo + ", itemCategory=" + itemCategory
				+ ", issueDate=" + issueDate + ", deptId=" + deptId + ", subDeptId=" + subDeptId + ", accHead="
				+ accHead + ", deleteStatus=" + deleteStatus + ", status=" + status + ", issueSlipNo=" + issueSlipNo
				+ ", issueDetailList=" + issueDetailList + "]";
	}
	
	

}
