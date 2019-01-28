package com.ats.tril.model.mrn;

public class MrnReport {

	// mrn_detail fields

	private int mrnDetailId;

	private int mrnId;

	private int itemId;

	private int indentQty;

	private int poQty;// ie Chalan Qty for Mrn Report

	private int mrnQty;

	private int approveQty;

	private int rejectQty;

	private int rejectRemark;

	private String batchNo;

	private int issueQty;

	private int remainingQty;

	private int poId;

	private String poNo;

	private int poDetailId;

	private int mrnDetailStatus;

	private int delStatus;

	// m_item fields
	private String itemCode;

	private String itemDesc;

	// mrn Header fields
	private String mrnNo;

	private String mrnDate;

	private int mrnType;

	private String vendorName;

	private int mrnStatus;

	private int userId;

	// po_detail fields
	private float landingRate;

	private float itemRate;

	public int getMrnDetailId() {
		return mrnDetailId;
	}

	public int getMrnId() {
		return mrnId;
	}

	public int getItemId() {
		return itemId;
	}

	public int getIndentQty() {
		return indentQty;
	}

	public int getPoQty() {
		return poQty;
	}

	public int getMrnQty() {
		return mrnQty;
	}

	public int getApproveQty() {
		return approveQty;
	}

	public int getRejectQty() {
		return rejectQty;
	}

	public int getRejectRemark() {
		return rejectRemark;
	}

	public String getBatchNo() {
		return batchNo;
	}

	public int getIssueQty() {
		return issueQty;
	}

	public int getRemainingQty() {
		return remainingQty;
	}

	public int getPoId() {
		return poId;
	}

	public String getPoNo() {
		return poNo;
	}

	public int getPoDetailId() {
		return poDetailId;
	}

	public int getMrnDetailStatus() {
		return mrnDetailStatus;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public String getItemCode() {
		return itemCode;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public String getMrnNo() {
		return mrnNo;
	}

	public int getMrnType() {
		return mrnType;
	}

	public String getVendorName() {
		return vendorName;
	}

	public int getMrnStatus() {
		return mrnStatus;
	}

	public int getUserId() {
		return userId;
	}

	
	public void setMrnDetailId(int mrnDetailId) {
		this.mrnDetailId = mrnDetailId;
	}

	public void setMrnId(int mrnId) {
		this.mrnId = mrnId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public void setIndentQty(int indentQty) {
		this.indentQty = indentQty;
	}

	public void setPoQty(int poQty) {
		this.poQty = poQty;
	}

	public void setMrnQty(int mrnQty) {
		this.mrnQty = mrnQty;
	}

	public void setApproveQty(int approveQty) {
		this.approveQty = approveQty;
	}

	public void setRejectQty(int rejectQty) {
		this.rejectQty = rejectQty;
	}

	public void setRejectRemark(int rejectRemark) {
		this.rejectRemark = rejectRemark;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}

	public void setIssueQty(int issueQty) {
		this.issueQty = issueQty;
	}

	public void setRemainingQty(int remainingQty) {
		this.remainingQty = remainingQty;
	}

	public void setPoId(int poId) {
		this.poId = poId;
	}

	public void setPoNo(String poNo) {
		this.poNo = poNo;
	}

	public void setPoDetailId(int poDetailId) {
		this.poDetailId = poDetailId;
	}

	public void setMrnDetailStatus(int mrnDetailStatus) {
		this.mrnDetailStatus = mrnDetailStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public void setMrnNo(String mrnNo) {
		this.mrnNo = mrnNo;
	}

	public String getMrnDate() {
		return mrnDate;
	}

	public void setMrnDate(String mrnDate) {
		this.mrnDate = mrnDate;
	}

	public void setMrnType(int mrnType) {
		this.mrnType = mrnType;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public void setMrnStatus(int mrnStatus) {
		this.mrnStatus = mrnStatus;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public float getLandingRate() {
		return landingRate;
	}

	public float getItemRate() {
		return itemRate;
	}

	public void setLandingRate(float landingRate) {
		this.landingRate = landingRate;
	}

	public void setItemRate(float itemRate) {
		this.itemRate = itemRate;
	}

	@Override
	public String toString() {
		return "MrnReport [mrnDetailId=" + mrnDetailId + ", mrnId=" + mrnId + ", itemId=" + itemId + ", indentQty="
				+ indentQty + ", poQty=" + poQty + ", mrnQty=" + mrnQty + ", approveQty=" + approveQty + ", rejectQty="
				+ rejectQty + ", rejectRemark=" + rejectRemark + ", batchNo=" + batchNo + ", issueQty=" + issueQty
				+ ", remainingQty=" + remainingQty + ", poId=" + poId + ", poNo=" + poNo + ", poDetailId=" + poDetailId
				+ ", mrnDetailStatus=" + mrnDetailStatus + ", delStatus=" + delStatus + ", itemCode=" + itemCode
				+ ", itemDesc=" + itemDesc + ", mrnNo=" + mrnNo + ", mrnDate=" + mrnDate + ", mrnType=" + mrnType
				+ ", vendorName=" + vendorName + ", mrnStatus=" + mrnStatus + ", userId=" + userId + ", landingRate="
				+ landingRate + ", itemRate=" + itemRate + "]";
	}

}
