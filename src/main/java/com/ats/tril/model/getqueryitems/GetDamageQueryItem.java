package com.ats.tril.model.getqueryitems;

import java.util.Date;




public class GetDamageQueryItem {
	
	
	private int damageId;
	
	private String date;
	
	private int itemId;
	
	private float qty;
	
	private float value;
	
	private String reason;
	
	private int delStatus;
	
	private String itemDesc;
	private String itemCode;
	private String itemUom;
	
	
	
	
	public int getDamageId() {
		return damageId;
	}
	public String getDate() {
		return date;
	}
	public int getItemId() {
		return itemId;
	}
	public float getQty() {
		return qty;
	}
	public float getValue() {
		return value;
	}
	public String getReason() {
		return reason;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public String getItemCode() {
		return itemCode;
	}
	public String getItemUom() {
		return itemUom;
	}
	public void setDamageId(int damageId) {
		this.damageId = damageId;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public void setQty(float qty) {
		this.qty = qty;
	}
	public void setValue(float value) {
		this.value = value;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}
	
	@Override
	public String toString() {
		return "GetDamageQueryItem [damageId=" + damageId + ", date=" + date + ", itemId=" + itemId + ", qty=" + qty
				+ ", value=" + value + ", reason=" + reason + ", delStatus=" + delStatus + ", itemDesc=" + itemDesc
				+ ", itemCode=" + itemCode + ", itemUom=" + itemUom + "]";
	}

}
