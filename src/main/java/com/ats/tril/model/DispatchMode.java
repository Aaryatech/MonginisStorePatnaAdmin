package com.ats.tril.model;

public class DispatchMode {
	 
	private int dispModeId; 
	private String dispModeDesc; 
	private int isUsed; 
	private int createdIn; 
	private int deletedIn;
	public int getDispModeId() {
		return dispModeId;
	}
	public void setDispModeId(int dispModeId) {
		this.dispModeId = dispModeId;
	}
	public String getDispModeDesc() {
		return dispModeDesc;
	}
	public void setDispModeDesc(String dispModeDesc) {
		this.dispModeDesc = dispModeDesc;
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
		return "DispatchMode [dispModeId=" + dispModeId + ", dispModeDesc=" + dispModeDesc + ", isUsed=" + isUsed
				+ ", createdIn=" + createdIn + ", deletedIn=" + deletedIn + "]";
	}
	
	

}
