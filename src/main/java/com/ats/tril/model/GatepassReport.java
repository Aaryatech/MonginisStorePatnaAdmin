package com.ats.tril.model;

public class GatepassReport {

	private int gpDetailId;
	private int gpId;
	private int gpNo;
	private int gpVendor;
	private String gpDate;
	private String gpReturnDate;

	private int gpItemId;
	private float gpQty;
	private int gpNoDays;

	private float gpRemQty;
	private float gpRetQty;

	private int gpStatus;

	private String vendorName;
	private String vendorCode;
	private String itemCode;
	private String itemDesc;

	public int getGpDetailId() {
		return gpDetailId;
	}

	public void setGpDetailId(int gpDetailId) {
		this.gpDetailId = gpDetailId;
	}

	public int getGpId() {
		return gpId;
	}

	public void setGpId(int gpId) {
		this.gpId = gpId;
	}

	public int getGpNo() {
		return gpNo;
	}

	public void setGpNo(int gpNo) {
		this.gpNo = gpNo;
	}

	public int getGpVendor() {
		return gpVendor;
	}

	public void setGpVendor(int gpVendor) {
		this.gpVendor = gpVendor;
	}

	public String getGpDate() {
		return gpDate;
	}

	public void setGpDate(String gpDate) {
		this.gpDate = gpDate;
	}

	public String getGpReturnDate() {
		return gpReturnDate;
	}

	public void setGpReturnDate(String gpReturnDate) {
		this.gpReturnDate = gpReturnDate;
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

	public int getGpNoDays() {
		return gpNoDays;
	}

	public void setGpNoDays(int gpNoDays) {
		this.gpNoDays = gpNoDays;
	}

	public float getGpRemQty() {
		return gpRemQty;
	}

	public void setGpRemQty(float gpRemQty) {
		this.gpRemQty = gpRemQty;
	}

	public float getGpRetQty() {
		return gpRetQty;
	}

	public void setGpRetQty(float gpRetQty) {
		this.gpRetQty = gpRetQty;
	}

	public int getGpStatus() {
		return gpStatus;
	}

	public void setGpStatus(int gpStatus) {
		this.gpStatus = gpStatus;
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
		return "GatepassReport [gpDetailId=" + gpDetailId + ", gpId=" + gpId + ", gpNo=" + gpNo + ", gpVendor="
				+ gpVendor + ", gpDate=" + gpDate + ", gpReturnDate=" + gpReturnDate + ", gpItemId=" + gpItemId
				+ ", gpQty=" + gpQty + ", gpNoDays=" + gpNoDays + ", gpRemQty=" + gpRemQty + ", gpRetQty=" + gpRetQty
				+ ", gpStatus=" + gpStatus + ", vendorName=" + vendorName + ", vendorCode=" + vendorCode + ", itemCode="
				+ itemCode + ", itemDesc=" + itemDesc + "]";
	}

}
