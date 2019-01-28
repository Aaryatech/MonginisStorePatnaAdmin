package com.ats.tril.model;

public class DeliveryTerms {
	
	private int deliveryTermId; 
	private String deliveryDesc; 
	private int isUsed; 
	private int createdIn; 
	private int deletedIn;
	public int getDeliveryTermId() {
		return deliveryTermId;
	}
	public void setDeliveryTermId(int deliveryTermId) {
		this.deliveryTermId = deliveryTermId;
	}
	public String getDeliveryDesc() {
		return deliveryDesc;
	}
	public void setDeliveryDesc(String deliveryDesc) {
		this.deliveryDesc = deliveryDesc;
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
		return "DeliveryTerms [deliveryTermId=" + deliveryTermId + ", deliveryDesc=" + deliveryDesc + ", isUsed="
				+ isUsed + ", createdIn=" + createdIn + ", deletedIn=" + deletedIn + "]";
	}
	
	

}
