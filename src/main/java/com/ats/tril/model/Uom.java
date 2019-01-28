package com.ats.tril.model;

public class Uom {
	
	private int uomId; 
	private String uom; 
	private int isUsed;
	public int getUomId() {
		return uomId;
	}
	public void setUomId(int uomId) {
		this.uomId = uomId;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	@Override
	public String toString() {
		return "Uom [uomId=" + uomId + ", uom=" + uom + ", isUsed=" + isUsed + "]";
	}
	
	

}
