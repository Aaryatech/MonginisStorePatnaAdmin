package com.ats.tril.model.doc;

public class IssueReportDetail {
	
	private int issueDetailId;

	private int issueId;

	private int itemGroupId;

	private int deptId;

	private int subDeptId;

	private int accHead;

	private int itemId;

	private int itemIssueQty;

	private int itemRequestQty;

	private int itemPendingQty;

	private int status;
	private int delStatus;

	private String itemCode;
	private String itemDesc;

	private String deptDesc;
	private String subDeptDesc;
	private String accHeadDesc;
	
	private String	itemUom;
	
	
		
	
	public String getItemUom() {
		return itemUom;
	}
	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}
	public int getIssueDetailId() {
		return issueDetailId;
	}
	public void setIssueDetailId(int issueDetailId) {
		this.issueDetailId = issueDetailId;
	}
	public int getIssueId() {
		return issueId;
	}
	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}
	public int getItemGroupId() {
		return itemGroupId;
	}
	public void setItemGroupId(int itemGroupId) {
		this.itemGroupId = itemGroupId;
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
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getItemIssueQty() {
		return itemIssueQty;
	}
	public void setItemIssueQty(int itemIssueQty) {
		this.itemIssueQty = itemIssueQty;
	}
	public int getItemRequestQty() {
		return itemRequestQty;
	}
	public void setItemRequestQty(int itemRequestQty) {
		this.itemRequestQty = itemRequestQty;
	}
	public int getItemPendingQty() {
		return itemPendingQty;
	}
	public void setItemPendingQty(int itemPendingQty) {
		this.itemPendingQty = itemPendingQty;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public String getDeptDesc() {
		return deptDesc;
	}
	public void setDeptDesc(String deptDesc) {
		this.deptDesc = deptDesc;
	}
	public String getSubDeptDesc() {
		return subDeptDesc;
	}
	public void setSubDeptDesc(String subDeptDesc) {
		this.subDeptDesc = subDeptDesc;
	}
	public String getAccHeadDesc() {
		return accHeadDesc;
	}
	public void setAccHeadDesc(String accHeadDesc) {
		this.accHeadDesc = accHeadDesc;
	}
	
	
	@Override
	public String toString() {
		return "IssueReportDetail [issueDetailId=" + issueDetailId + ", issueId=" + issueId + ", itemGroupId="
				+ itemGroupId + ", deptId=" + deptId + ", subDeptId=" + subDeptId + ", accHead=" + accHead + ", itemId="
				+ itemId + ", itemIssueQty=" + itemIssueQty + ", itemRequestQty=" + itemRequestQty + ", itemPendingQty="
				+ itemPendingQty + ", status=" + status + ", delStatus=" + delStatus + ", itemCode=" + itemCode
				+ ", itemDesc=" + itemDesc + ", deptDesc=" + deptDesc + ", subDeptDesc=" + subDeptDesc
				+ ", accHeadDesc=" + accHeadDesc + ", itemUom=" + itemUom + "]";
	}
	
		

}
