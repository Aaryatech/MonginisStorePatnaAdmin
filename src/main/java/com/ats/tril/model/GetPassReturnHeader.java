package com.ats.tril.model;
 
import java.util.List;
 

public class GetPassReturnHeader {
	 
	private int returnId; 
	private String returnNo; 
	private int gpId; 
	private String gpNo; 
	private int vendorId; 
	private String gpReturnDate; 
	private String gpRemark; 
	private String gpRemark1; 
	private int status; 
	private int isUsed; 
	private String vendorName; 
	List<GetPassReturnDetailWithItemName> getPassReturnDetailList;
	public int getReturnId() {
		return returnId;
	}
	public void setReturnId(int returnId) {
		this.returnId = returnId;
	}
	public String getReturnNo() {
		return returnNo;
	}
	public void setReturnNo(String returnNo) {
		this.returnNo = returnNo;
	}
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
	public int getVendorId() {
		return vendorId;
	}
	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}
	public String getGpReturnDate() {
		return gpReturnDate;
	}
	public void setGpReturnDate(String gpReturnDate) {
		this.gpReturnDate = gpReturnDate;
	}
	public String getGpRemark() {
		return gpRemark;
	}
	public void setGpRemark(String gpRemark) {
		this.gpRemark = gpRemark;
	}
	public String getGpRemark1() {
		return gpRemark1;
	}
	public void setGpRemark1(String gpRemark1) {
		this.gpRemark1 = gpRemark1;
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
	public List<GetPassReturnDetailWithItemName> getGetPassReturnDetailList() {
		return getPassReturnDetailList;
	}
	public void setGetPassReturnDetailList(List<GetPassReturnDetailWithItemName> getPassReturnDetailList) {
		this.getPassReturnDetailList = getPassReturnDetailList;
	}
	@Override
	public String toString() {
		return "GetPassReturnHeader [returnId=" + returnId + ", returnNo=" + returnNo + ", gpId=" + gpId + ", gpNo="
				+ gpNo + ", vendorId=" + vendorId + ", gpReturnDate=" + gpReturnDate + ", gpRemark=" + gpRemark
				+ ", gpRemark1=" + gpRemark1 + ", status=" + status + ", isUsed=" + isUsed + ", vendorName="
				+ vendorName + ", getPassReturnDetailList=" + getPassReturnDetailList + "]";
	}
	
	

}
