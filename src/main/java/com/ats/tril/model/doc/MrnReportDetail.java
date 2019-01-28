package com.ats.tril.model.doc;

public class MrnReportDetail {

	private int mrnDetailId;

	private int mrnId;

	private int itemId;

	private float indentQty;

	private float poQty;

	private float mrnQty;

	private float approveQty;

	private float rejectQty;

	private int rejectRemark;

	private String batchNo;

	private float issueQty;

	private float remainingQty;

	private int poId;

	private String poNo;

	private int poDetailId;

	private int mrnDetailStatus;

	private int delStatus;

	private String itemCode;
	private String itemDesc;
	
	private String itemUom;
	
	
	
	

	public String getItemUom() {
		return itemUom;
	}

	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}

	public int getMrnDetailId() {
		return mrnDetailId;
	}

	public void setMrnDetailId(int mrnDetailId) {
		this.mrnDetailId = mrnDetailId;
	}

	public int getMrnId() {
		return mrnId;
	}

	public void setMrnId(int mrnId) {
		this.mrnId = mrnId;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public float getIndentQty() {
		return indentQty;
	}

	public void setIndentQty(float indentQty) {
		this.indentQty = indentQty;
	}

	public float getPoQty() {
		return poQty;
	}

	public void setPoQty(float poQty) {
		this.poQty = poQty;
	}

	public float getMrnQty() {
		return mrnQty;
	}

	public void setMrnQty(float mrnQty) {
		this.mrnQty = mrnQty;
	}

	public float getApproveQty() {
		return approveQty;
	}

	public void setApproveQty(float approveQty) {
		this.approveQty = approveQty;
	}

	public float getRejectQty() {
		return rejectQty;
	}

	public void setRejectQty(float rejectQty) {
		this.rejectQty = rejectQty;
	}

	public int getRejectRemark() {
		return rejectRemark;
	}

	public void setRejectRemark(int rejectRemark) {
		this.rejectRemark = rejectRemark;
	}

	public String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}

	public float getIssueQty() {
		return issueQty;
	}

	public void setIssueQty(float issueQty) {
		this.issueQty = issueQty;
	}

	public float getRemainingQty() {
		return remainingQty;
	}

	public void setRemainingQty(float remainingQty) {
		this.remainingQty = remainingQty;
	}

	public int getPoId() {
		return poId;
	}

	public void setPoId(int poId) {
		this.poId = poId;
	}

	public String getPoNo() {
		return poNo;
	}

	public void setPoNo(String poNo) {
		this.poNo = poNo;
	}

	public int getPoDetailId() {
		return poDetailId;
	}

	public void setPoDetailId(int poDetailId) {
		this.poDetailId = poDetailId;
	}

	public int getMrnDetailStatus() {
		return mrnDetailStatus;
	}

	public void setMrnDetailStatus(int mrnDetailStatus) {
		this.mrnDetailStatus = mrnDetailStatus;
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

	@Override
	public String toString() {
		return "MrnReportDetail [mrnDetailId=" + mrnDetailId + ", mrnId=" + mrnId + ", itemId=" + itemId
				+ ", indentQty=" + indentQty + ", poQty=" + poQty + ", mrnQty=" + mrnQty + ", approveQty=" + approveQty
				+ ", rejectQty=" + rejectQty + ", rejectRemark=" + rejectRemark + ", batchNo=" + batchNo + ", issueQty="
				+ issueQty + ", remainingQty=" + remainingQty + ", poId=" + poId + ", poNo=" + poNo + ", poDetailId="
				+ poDetailId + ", mrnDetailStatus=" + mrnDetailStatus + ", delStatus=" + delStatus + ", itemCode="
				+ itemCode + ", itemDesc=" + itemDesc + ", itemUom=" + itemUom + "]";
	}

	
}
