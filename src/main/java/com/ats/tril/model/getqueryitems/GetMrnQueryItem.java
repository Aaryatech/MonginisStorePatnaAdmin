package com.ats.tril.model.getqueryitems;

public class GetMrnQueryItem {

	private int mrnDetailId;
	
	private String mrnNo;
	
	private String mrnDate;
	
	private String vendorCode;
	private String vendorName;
	
	private float mrnQty;//ie recd Qty
	
	private float chalanQty;
	private float approveQty;
	private float rejectQty;
	private String poNo;
	private String poDate;
	
	private String itemDesc;
	private String itemCode;
	private String itemUom;

	private String indNo;
	private String indDate;
	
	private int mrnDetailStatus;

	public int getMrnDetailId() {
		return mrnDetailId;
	}

	public String getMrnNo() {
		return mrnNo;
	}

	public String getMrnDate() {
		return mrnDate;
	}

	public String getVendorCode() {
		return vendorCode;
	}

	public String getVendorName() {
		return vendorName;
	}

	public float getMrnQty() {
		return mrnQty;
	}

	public float getChalanQty() {
		return chalanQty;
	}

	public float getApproveQty() {
		return approveQty;
	}

	public float getRejectQty() {
		return rejectQty;
	}

	public String getPoNo() {
		return poNo;
	}
	public String getPoDate() {
		return poDate;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public String getItemCode() {
		return itemCode;
	}

	public String getItemUom() {
		return itemUom;
	}

	public String getIndNo() {
		return indNo;
	}

	public String getIndDate() {
		return indDate;
	}

	public int getMrnDetailStatus() {
		return mrnDetailStatus;
	}

	public void setMrnDetailId(int mrnDetailId) {
		this.mrnDetailId = mrnDetailId;
	}

	public void setMrnNo(String mrnNo) {
		this.mrnNo = mrnNo;
	}

	public void setMrnDate(String mrnDate) {
		this.mrnDate = mrnDate;
	}

	public void setVendorCode(String vendorCode) {
		this.vendorCode = vendorCode;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public void setMrnQty(float mrnQty) {
		this.mrnQty = mrnQty;
	}

	public void setChalanQty(float chalanQty) {
		this.chalanQty = chalanQty;
	}

	public void setApproveQty(float approveQty) {
		this.approveQty = approveQty;
	}

	public void setRejectQty(float rejectQty) {
		this.rejectQty = rejectQty;
	}

	public void setPoNo(String poNo) {
		this.poNo = poNo;
	}

	public void setPoDate(String poDate) {
		this.poDate = poDate;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}

	public void setIndNo(String indNo) {
		this.indNo = indNo;
	}

	public void setIndDate(String indDate) {
		this.indDate = indDate;
	}

	public void setMrnDetailStatus(int mrnDetailStatus) {
		this.mrnDetailStatus = mrnDetailStatus;
	}

	@Override
	public String toString() {
		return "GetMrnQueryItem [mrnDetailId=" + mrnDetailId + ", mrnNo=" + mrnNo + ", mrnDate=" + mrnDate
				+ ", vendorCode=" + vendorCode + ", vendorName=" + vendorName + ", mrnQty=" + mrnQty + ", chalanQty="
				+ chalanQty + ", approveQty=" + approveQty + ", rejectQty=" + rejectQty + ", poNo=" + poNo + ", poDate="
				+ poDate + ", itemDesc=" + itemDesc + ", itemCode=" + itemCode + ", itemUom=" + itemUom + ", indNo="
				+ indNo + ", indDate=" + indDate + ", mrnDetailStatus=" + mrnDetailStatus + "]";
	}
	
}
