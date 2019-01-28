package com.ats.tril.model.rejection;

public class GetRejectionMemoDetail {
	
	private int rejDetailId;

	private int rejectionId;

	private int itemId;
	
	private String itemCode;

	private float rejectionQty;

	private float memoQty;

	private String mrnNo;

	private String mrnDate;

	private int status;
	private int isUsed;

	

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

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	
	

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	@Override
	public String toString() {
		return "GetRejectionMemoDetail [rejDetailId=" + rejDetailId + ", rejectionId=" + rejectionId + ", itemId="
				+ itemId + ", itemCode=" + itemCode + ", rejectionQty=" + rejectionQty + ", memoQty=" + memoQty
				+ ", mrnNo=" + mrnNo + ", mrnDate=" + mrnDate + ", status=" + status + ", isUsed=" + isUsed + "]";
	}


}
