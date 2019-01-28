package com.ats.tril.model;

public class Category {
	
	private int catId; 
	private String catDesc;
	private String catPrefix;
	private int catSeq; 
	private int isUsed; 
	private int createdIn; 
	private int deletedIn;
	private int monthlyLimit; 
	private int yearlyLimit;
	
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getCatDesc() {
		return catDesc;
	}
	public void setCatDesc(String catDesc) {
		this.catDesc = catDesc;
	}
	public int getCatSeq() {
		return catSeq;
	}
	public void setCatSeq(int catSeq) {
		this.catSeq = catSeq;
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
	
	public String getCatPrefix() {
		return catPrefix;
	}
	public void setCatPrefix(String catPrefix) {
		this.catPrefix = catPrefix;
	}
	public int getMonthlyLimit() {
		return monthlyLimit;
	}
	public void setMonthlyLimit(int monthlyLimit) {
		this.monthlyLimit = monthlyLimit;
	}
	public int getYearlyLimit() {
		return yearlyLimit;
	}
	public void setYearlyLimit(int yearlyLimit) {
		this.yearlyLimit = yearlyLimit;
	}
	@Override
	public String toString() {
		return "Category [catId=" + catId + ", catDesc=" + catDesc + ", catPrefix=" + catPrefix + ", catSeq=" + catSeq
				+ ", isUsed=" + isUsed + ", createdIn=" + createdIn + ", deletedIn=" + deletedIn + ", monthlyLimit="
				+ monthlyLimit + ", yearlyLimit=" + yearlyLimit + "]";
	}
	
	

}
