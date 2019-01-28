package com.ats.tril.model;

import java.util.List;

public class GetpassHeader {
	private int gpId;
	private String gpNo;
	private int gpVendor;
	private int gpType;
	private String gpReturnDate;
	private int gpStatus;
	private int isUsed;

	private String remark1;
	private String remark2;
	private String sendingWith;
	private int isStockable;
	private int forRepair;
	private String gpDate;

	List<GetpassDetail> getpassDetail;

	public int getGpId() {
		return gpId;
	}

	public void setGpId(int gpId) {
		this.gpId = gpId;
	}

	public String getGpNo() {
		return gpNo;
	}

	public void setGpNo(String gpNo) {
		this.gpNo = gpNo;
	}

	public int getGpVendor() {
		return gpVendor;
	}

	public void setGpVendor(int gpVendor) {
		this.gpVendor = gpVendor;
	}

	public int getGpType() {
		return gpType;
	}

	public void setGpType(int gpType) {
		this.gpType = gpType;
	}

	public String getGpReturnDate() {
		return gpReturnDate;
	}

	public void setGpReturnDate(String gpReturnDate) {
		this.gpReturnDate = gpReturnDate;
	}

	public int getGpStatus() {
		return gpStatus;
	}

	public void setGpStatus(int gpStatus) {
		this.gpStatus = gpStatus;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	public String getRemark1() {
		return remark1;
	}

	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}

	public String getRemark2() {
		return remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

	public String getSendingWith() {
		return sendingWith;
	}

	public void setSendingWith(String sendingWith) {
		this.sendingWith = sendingWith;
	}

	public int getIsStockable() {
		return isStockable;
	}

	public void setIsStockable(int isStockable) {
		this.isStockable = isStockable;
	}

	public int getForRepair() {
		return forRepair;
	}

	public void setForRepair(int forRepair) {
		this.forRepair = forRepair;
	}

	public String getGpDate() {
		return gpDate;
	}

	public void setGpDate(String gpDate) {
		this.gpDate = gpDate;
	}

	public List<GetpassDetail> getGetpassDetail() {
		return getpassDetail;
	}

	public void setGetpassDetail(List<GetpassDetail> getpassDetail) {
		this.getpassDetail = getpassDetail;
	}

	@Override
	public String toString() {
		return "GetpassHeader [gpId=" + gpId + ", gpNo=" + gpNo + ", gpVendor=" + gpVendor + ", gpType=" + gpType
				+ ", gpReturnDate=" + gpReturnDate + ", gpStatus=" + gpStatus + ", isUsed=" + isUsed + ", remark1="
				+ remark1 + ", remark2=" + remark2 + ", sendingWith=" + sendingWith + ", isStockable=" + isStockable
				+ ", forRepair=" + forRepair + ", gpDate=" + gpDate + ", getpassDetail=" + getpassDetail + "]";
	}

	 
}
