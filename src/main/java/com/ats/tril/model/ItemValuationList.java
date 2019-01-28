package com.ats.tril.model;

public class ItemValuationList {
	
	private String date;
	private String typeName;
	private int type;
	private String receptNo; 
	private float qty;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getReceptNo() {
		return receptNo;
	}
	public void setReceptNo(String receptNo) {
		this.receptNo = receptNo;
	}
	public float getQty() {
		return qty;
	}
	public void setQty(float qty) {
		this.qty = qty;
	}
	@Override
	public String toString() {
		return "ItemValuationList [date=" + date + ", typeName=" + typeName + ", type=" + type + ", receptNo="
				+ receptNo + ", qty=" + qty + "]";
	}
	
	

}
