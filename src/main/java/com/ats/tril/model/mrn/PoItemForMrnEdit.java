package com.ats.tril.model.mrn;

public class PoItemForMrnEdit{
	
	
	private int poDetailId;
	
	private int itemId;
	
	private String itemDesc;
	
	private int poId;
	
	private String itemCode;
	
	public int getPoDetailId() {
		return poDetailId;
	}
	public int getItemId() {
		return itemId;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public int getPoId() {
		return poId;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setPoDetailId(int poDetailId) {
		this.poDetailId = poDetailId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public void setPoId(int poId) {
		this.poId = poId;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	
	@Override
	public String toString() {
		return "PoItemForMrnEdit [poDetailId=" + poDetailId + ", itemId=" + itemId + ", itemDesc=" + itemDesc
				+ ", poId=" + poId + ", itemCode=" + itemCode + "]";
	}

}
