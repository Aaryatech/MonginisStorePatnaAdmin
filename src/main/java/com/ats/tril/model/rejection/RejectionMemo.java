package com.ats.tril.model.rejection;

import java.util.List;



public class RejectionMemo {
	
	private int rejectionId;

	private String rejectionNo;

	private int vendorId;
	private int mrnId;
	private String mrnNo;
	private String rejectionDate;
	private int dcoId;
	private String dcoDate;
	private String rejectionRemark;
	private String rejectionRemark1;
	private int status;
	private int isUsed;

	List<RejectionMemoDetail> rejectionMemoDetailList;

	public int getRejectionId() {
		return rejectionId;
	}

	public void setRejectionId(int rejectionId) {
		this.rejectionId = rejectionId;
	}

	public String getRejectionNo() {
		return rejectionNo;
	}

	public void setRejectionNo(String rejectionNo) {
		this.rejectionNo = rejectionNo;
	}

	public int getVendorId() {
		return vendorId;
	}

	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}

	public int getMrnId() {
		return mrnId;
	}

	public void setMrnId(int mrnId) {
		this.mrnId = mrnId;
	}

	
	public String getMrnNo() {
		return mrnNo;
	}

	public void setMrnNo(String mrnNo) {
		this.mrnNo = mrnNo;
	}

	public String getRejectionDate() {
		return rejectionDate;
	}

	public void setRejectionDate(String rejectionDate) {
		this.rejectionDate = rejectionDate;
	}

	public int getDcoId() {
		return dcoId;
	}

	public void setDcoId(int dcoId) {
		this.dcoId = dcoId;
	}

	public String getDcoDate() {
		return dcoDate;
	}

	public void setDcoDate(String dcoDate) {
		this.dcoDate = dcoDate;
	}

	public String getRejectionRemark() {
		return rejectionRemark;
	}

	public void setRejectionRemark(String rejectionRemark) {
		this.rejectionRemark = rejectionRemark;
	}

	public String getRejectionRemark1() {
		return rejectionRemark1;
	}

	public void setRejectionRemark1(String rejectionRemark1) {
		this.rejectionRemark1 = rejectionRemark1;
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

	public List<RejectionMemoDetail> getRejectionMemoDetailList() {
		return rejectionMemoDetailList;
	}

	public void setRejectionMemoDetailList(List<RejectionMemoDetail> rejectionMemoDetailList) {
		this.rejectionMemoDetailList = rejectionMemoDetailList;
	}

	@Override
	public String toString() {
		return "RejectionMemo [rejectionId=" + rejectionId + ", rejectionNo=" + rejectionNo + ", vendorId=" + vendorId
				+ ", mrnId=" + mrnId + ", mrnNo=" + mrnNo + ", rejectionDate=" + rejectionDate + ", dcoId=" + dcoId
				+ ", dcoDate=" + dcoDate + ", rejectionRemark=" + rejectionRemark + ", rejectionRemark1="
				+ rejectionRemark1 + ", status=" + status + ", isUsed=" + isUsed + ", rejectionMemoDetailList="
				+ rejectionMemoDetailList + "]";
	}
	
	

}
