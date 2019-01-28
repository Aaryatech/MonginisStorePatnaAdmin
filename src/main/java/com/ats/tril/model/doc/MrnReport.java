package com.ats.tril.model.doc;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MrnReport {

	private int mrnId;

	private String mrnNo;

	private String mrnDate;

	private int mrnType;

	private String vendorId;

	private String gateEntryNo;
	
	private String gateEntryDate;

	private String docNo;// chalan no
	private String docDate;// chalan Date

	private String billNo;
	private String billDate;

	private int userId;

	private String transport;

	private String lrNo;

	private String lrDate;
	private String remark1;
	private String remark2;

	private int mrnStatus;

	private int delStatus;

	private String vendorCode;
	private String vendorName;
	private String vendorAdd1;

	List<MrnReportDetail> mrnReportDetailList;

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

	public String getMrnDate() {
		return mrnDate;
	}

	public void setMrnDate(String mrnDate) {
		this.mrnDate = mrnDate;
	}

	public int getMrnType() {
		return mrnType;
	}

	public void setMrnType(int mrnType) {
		this.mrnType = mrnType;
	}

	public String getVendorId() {
		return vendorId;
	}

	public void setVendorId(String vendorId) {
		this.vendorId = vendorId;
	}

	public String getGateEntryNo() {
		return gateEntryNo;
	}

	public void setGateEntryNo(String gateEntryNo) {
		this.gateEntryNo = gateEntryNo;
	}

	public String getGateEntryDate() {
		return gateEntryDate;
	}

	public void setGateEntryDate(String gateEntryDate) {
		this.gateEntryDate = gateEntryDate;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getDocDate() {
		return docDate;
	}

	public void setDocDate(String docDate) {
		this.docDate = docDate;
	}

	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTransport() {
		return transport;
	}

	public void setTransport(String transport) {
		this.transport = transport;
	}

	public String getLrNo() {
		return lrNo;
	}

	public void setLrNo(String lrNo) {
		this.lrNo = lrNo;
	}

	public String getLrDate() {
		return lrDate;
	}

	public void setLrDate(String lrDate) {
		this.lrDate = lrDate;
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

	public int getMrnStatus() {
		return mrnStatus;
	}

	public void setMrnStatus(int mrnStatus) {
		this.mrnStatus = mrnStatus;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public String getVendorCode() {
		return vendorCode;
	}

	public void setVendorCode(String vendorCode) {
		this.vendorCode = vendorCode;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public String getVendorAdd1() {
		return vendorAdd1;
	}

	public void setVendorAdd1(String vendorAdd1) {
		this.vendorAdd1 = vendorAdd1;
	}

	public List<MrnReportDetail> getMrnReportDetailList() {
		return mrnReportDetailList;
	}

	public void setMrnReportDetailList(List<MrnReportDetail> mrnReportDetailList) {
		this.mrnReportDetailList = mrnReportDetailList;
	}

	@Override
	public String toString() {
		return "MrnReport [mrnId=" + mrnId + ", mrnNo=" + mrnNo + ", mrnDate=" + mrnDate + ", mrnType=" + mrnType
				+ ", vendorId=" + vendorId + ", gateEntryNo=" + gateEntryNo + ", gateEntryDate=" + gateEntryDate
				+ ", docNo=" + docNo + ", docDate=" + docDate + ", billNo=" + billNo + ", billDate=" + billDate
				+ ", userId=" + userId + ", transport=" + transport + ", lrNo=" + lrNo + ", lrDate=" + lrDate
				+ ", remark1=" + remark1 + ", remark2=" + remark2 + ", mrnStatus=" + mrnStatus + ", delStatus="
				+ delStatus + ", vendorCode=" + vendorCode + ", vendorName=" + vendorName + ", vendorAdd1=" + vendorAdd1
				+ ", mrnReportDetailList=" + mrnReportDetailList + "]";
	}


	
	
}
