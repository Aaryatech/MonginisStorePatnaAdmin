package com.ats.tril.model;

public class AccountHead {
	
	
	private int accHeadId; 
	private String accHeadDesc; 
	private int isUsed; 
	private int createdIn; 
	private int deletedIn;
	public int getAccHeadId() {
		return accHeadId;
	}
	public void setAccHeadId(int accHeadId) {
		this.accHeadId = accHeadId;
	}
	public String getAccHeadDesc() {
		return accHeadDesc;
	}
	public void setAccHeadDesc(String accHeadDesc) {
		this.accHeadDesc = accHeadDesc;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	public int getCreatedIn() {
		return createdIn;
	}
	public void setCreatedIn(int createdIn) {
		this.createdIn = createdIn;
	}
	public int getDeletedIn() {
		return deletedIn;
	}
	public void setDeletedIn(int deletedIn) {
		this.deletedIn = deletedIn;
	}
	@Override
	public String toString() {
		return "AccountHead [accHeadId=" + accHeadId + ", accHeadDesc=" + accHeadDesc + ", isUsed=" + isUsed
				+ ", createdIn=" + createdIn + ", deletedIn=" + deletedIn + "]";
	}
	
	

}
