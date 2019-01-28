package com.ats.tril.model.doc;

import java.util.Date;
import java.util.List;



public class RejectionReport {

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

	private String vendorName;
	private String vendorCode;
	private String vendorAdd1;

	List<RejectionReportDetail> rejReportDetailList;

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

	public String getVendorAdd1() {
		return vendorAdd1;
	}

	public void setVendorAdd1(String vendorAdd1) {
		this.vendorAdd1 = vendorAdd1;
	}

	public List<RejectionReportDetail> getRejReportDetailList() {
		return rejReportDetailList;
	}

	public void setRejReportDetailList(List<RejectionReportDetail> rejReportDetailList) {
		this.rejReportDetailList = rejReportDetailList;
	}

	@Override
	public String toString() {
		return "RejectionReport [rejectionId=" + rejectionId + ", rejectionNo=" + rejectionNo + ", vendorId=" + vendorId
				+ ", mrnId=" + mrnId + ", mrnNo=" + mrnNo + ", rejectionDate=" + rejectionDate + ", dcoId=" + dcoId
				+ ", dcoDate=" + dcoDate + ", rejectionRemark=" + rejectionRemark + ", rejectionRemark1="
				+ rejectionRemark1 + ", status=" + status + ", isUsed=" + isUsed + ", vendorName=" + vendorName
				+ ", vendorCode=" + vendorCode + ", vendorAdd1=" + vendorAdd1 + ", rejReportDetailList="
				+ rejReportDetailList + "]";
	}
	
	
	
	
	
}
