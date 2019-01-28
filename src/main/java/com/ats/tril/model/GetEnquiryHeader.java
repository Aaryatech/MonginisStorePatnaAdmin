package com.ats.tril.model;

import java.util.List;

public class GetEnquiryHeader {

	private int enqId;
	private String enqDate;
	private int vendId;
	private String vendorName;
	private String vendorCode;

	private String enqRemark;
	private int enqStatus;
	private int delStatus;
	private String enqNo;
	private String indNo;
	private int indId;
	List<GetEnquiryDetail> enquiryDetailList;

	public int getEnqId() {
		return enqId;
	}

	public void setEnqId(int enqId) {
		this.enqId = enqId;
	}

	public String getEnqDate() {
		return enqDate;
	}

	public void setEnqDate(String enqDate) {
		this.enqDate = enqDate;
	}

	public int getVendId() {
		return vendId;
	}

	public void setVendId(int vendId) {
		this.vendId = vendId;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public String getEnqRemark() {
		return enqRemark;
	}

	public void setEnqRemark(String enqRemark) {
		this.enqRemark = enqRemark;
	}

	public int getEnqStatus() {
		return enqStatus;
	}

	public void setEnqStatus(int enqStatus) {
		this.enqStatus = enqStatus;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public String getEnqNo() {
		return enqNo;
	}

	public void setEnqNo(String enqNo) {
		this.enqNo = enqNo;
	}

	public String getIndNo() {
		return indNo;
	}

	public void setIndNo(String indNo) {
		this.indNo = indNo;
	}

	public int getIndId() {
		return indId;
	}

	public void setIndId(int indId) {
		this.indId = indId;
	}

	public List<GetEnquiryDetail> getEnquiryDetailList() {
		return enquiryDetailList;
	}

	public void setEnquiryDetailList(List<GetEnquiryDetail> enquiryDetailList) {
		this.enquiryDetailList = enquiryDetailList;
	}

	public String getVendorCode() {
		return vendorCode;
	}

	public void setVendorCode(String vendorCode) {
		this.vendorCode = vendorCode;
	}

	@Override
	public String toString() {
		return "GetEnquiryHeader [enqId=" + enqId + ", enqDate=" + enqDate + ", vendId=" + vendId + ", vendorName="
				+ vendorName + ", vendorCode=" + vendorCode + ", enqRemark=" + enqRemark + ", enqStatus=" + enqStatus
				+ ", delStatus=" + delStatus + ", enqNo=" + enqNo + ", indNo=" + indNo + ", indId=" + indId
				+ ", enquiryDetailList=" + enquiryDetailList + "]";
	}

}
