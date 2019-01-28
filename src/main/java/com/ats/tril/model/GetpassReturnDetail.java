package com.ats.tril.model;

public class GetpassReturnDetail {
	private int returnDetailId;
	private int returnId;
	private int gpItemId;

	private float gpQty;
	private float returnQty;
	private float remQty;

	private String remark;
	private String remark1;
	private int status;
	private int isUsed;

	public int getReturnDetailId() {
		return returnDetailId;
	}

	public void setReturnDetailId(int returnDetailId) {
		this.returnDetailId = returnDetailId;
	}

	public int getReturnId() {
		return returnId;
	}

	public void setReturnId(int returnId) {
		this.returnId = returnId;
	}

	public int getGpItemId() {
		return gpItemId;
	}

	public void setGpItemId(int gpItemId) {
		this.gpItemId = gpItemId;
	}

	public float getGpQty() {
		return gpQty;
	}

	public void setGpQty(float gpQty) {
		this.gpQty = gpQty;
	}

	public float getReturnQty() {
		return returnQty;
	}

	public void setReturnQty(float returnQty) {
		this.returnQty = returnQty;
	}

	public float getRemQty() {
		return remQty;
	}

	public void setRemQty(float remQty) {
		this.remQty = remQty;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRemark1() {
		return remark1;
	}

	public void setRemark1(String remark1) {
		this.remark1 = remark1;
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

	@Override
	public String toString() {
		return "GetpassReturnDetail [returnDetailId=" + returnDetailId + ", returnId=" + returnId + ", gpItemId="
				+ gpItemId + ", gpQty=" + gpQty + ", returnQty=" + returnQty + ", remQty=" + remQty + ", remark="
				+ remark + ", remark1=" + remark1 + ", status=" + status + ", isUsed=" + isUsed + "]";
	}

}
