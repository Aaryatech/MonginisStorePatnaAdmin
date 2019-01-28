package com.ats.tril.model.rejection;

import java.util.Date;

public class RejectionReport {
	private int rejDetailId;
	private int rejectionId;

	private int rejectionNo;

	private int vendorId;

	private String rejectionDate;
	private String vendorName;
	private String vendorCode;

	private int itemId;

	private String itemCode;

	private float rejectionQty;

	private float memoQty;

	private String mrnNo;

	private String mrnDate;

	private String itemDesc;

	public int getRejDetailId() {
		return rejDetailId;
	}

	public void setRejDetailId(int rejDetailId) {
		this.rejDetailId = rejDetailId;
	}

	public int getRejectionId() {
		return rejectionId;
	}

	public void setRejectionId(int rejectionId) {
		this.rejectionId = rejectionId;
	}

	public int getRejectionNo() {
		return rejectionNo;
	}

	public void setRejectionNo(int rejectionNo) {
		this.rejectionNo = rejectionNo;
	}

	public int getVendorId() {
		return vendorId;
	}

	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}

	public String getRejectionDate() {
		return rejectionDate;
	}

	public void setRejectionDate(String rejectionDate) {
		this.rejectionDate = rejectionDate;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public String getVendorCode() {
		return vendorCode;
	}

	public void setVendorCode(String vendorCode) {
		this.vendorCode = vendorCode;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public float getRejectionQty() {
		return rejectionQty;
	}

	public void setRejectionQty(float rejectionQty) {
		this.rejectionQty = rejectionQty;
	}

	public float getMemoQty() {
		return memoQty;
	}

	public void setMemoQty(float memoQty) {
		this.memoQty = memoQty;
	}

	public String getMrnNo() {
		return mrnNo;
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

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	@Override
	public String toString() {
		return "RejectionReport [rejDetailId=" + rejDetailId + ", rejectionId=" + rejectionId + ", rejectionNo="
				+ rejectionNo + ", vendorId=" + vendorId + ", rejectionDate=" + rejectionDate + ", vendorName="
				+ vendorName + ", vendorCode=" + vendorCode + ", itemId=" + itemId + ", itemCode=" + itemCode
				+ ", rejectionQty=" + rejectionQty + ", memoQty=" + memoQty + ", mrnNo=" + mrnNo + ", mrnDate="
				+ mrnDate + ", itemDesc=" + itemDesc + "]";
	}

}
