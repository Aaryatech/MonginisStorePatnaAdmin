package com.ats.tril.model.indent;
 

public class GetIndentByStatus {
	 
	private int indMId; 
	private String indMNo; 
	private String indMDate; 
	private int indMStatus; 
	private String indRemark;
	public int getIndMId() {
		return indMId;
	}
	public void setIndMId(int indMId) {
		this.indMId = indMId;
	}
	public String getIndMNo() {
		return indMNo;
	}
	public void setIndMNo(String indMNo) {
		this.indMNo = indMNo;
	}
	public String getIndMDate() {
		return indMDate;
	}
	public void setIndMDate(String indMDate) {
		this.indMDate = indMDate;
	}
	public int getIndMStatus() {
		return indMStatus;
	}
	public void setIndMStatus(int indMStatus) {
		this.indMStatus = indMStatus;
	}
	public String getIndRemark() {
		return indRemark;
	}
	public void setIndRemark(String indRemark) {
		this.indRemark = indRemark;
	}
	@Override
	public String toString() {
		return "GetIndentByStatus [indMId=" + indMId + ", indMNo=" + indMNo + ", indMDate=" + indMDate + ", indMStatus="
				+ indMStatus + ", indRemark=" + indRemark + "]";
	}
	
	

}
