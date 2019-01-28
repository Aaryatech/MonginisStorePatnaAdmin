package com.ats.tril.model;

import java.util.Date;

public class GetItem {
	
	private int itemId; 
	private String itemCode; 
	private String itemDesc; 
	private String itemDesc2; 
	private String itemDesc3; 
	private String itemUom; 
	private String itemUom2;
	private int catId; 
	private int grpId; 
	private int subGrpId;
	private Float itemOpRate; 
	private Float itemOpQty; 
	private Float itemClRate; 
	private Float itemClQty; 
	private String itemDate; 
	private Float itemWt; 
	private Float itemMinLevel; 
	private Float itemMaxLevel; 
	private Float itemRodLevel; 
	private String itemLocation; 
	private String itemAbc; 
	private int itemIsCritical; 
	private int itemIsCons; 
	private int itemIsCapital; 
	private String itemSchd; 
	private String itemLife; 
	private int isUsed; 
	private int createdIn; 
	private int deletedIn;
	private String catDesc;
	private String grpCode;
	private String subgrpDesc;
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public String getItemDesc2() {
		return itemDesc2;
	}
	public void setItemDesc2(String itemDesc2) {
		this.itemDesc2 = itemDesc2;
	}
	public String getItemDesc3() {
		return itemDesc3;
	}
	public void setItemDesc3(String itemDesc3) {
		this.itemDesc3 = itemDesc3;
	}
	public String getItemUom() {
		return itemUom;
	}
	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}
	public String getItemUom2() {
		return itemUom2;
	}
	public void setItemUom2(String itemUom2) {
		this.itemUom2 = itemUom2;
	}
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public int getGrpId() {
		return grpId;
	}
	public void setGrpId(int grpId) {
		this.grpId = grpId;
	}
	public int getSubGrpId() {
		return subGrpId;
	}
	public void setSubGrpId(int subGrpId) {
		this.subGrpId = subGrpId;
	}
	public Float getItemOpRate() {
		return itemOpRate;
	}
	public void setItemOpRate(Float itemOpRate) {
		this.itemOpRate = itemOpRate;
	}
	public Float getItemOpQty() {
		return itemOpQty;
	}
	public void setItemOpQty(Float itemOpQty) {
		this.itemOpQty = itemOpQty;
	}
	public Float getItemClRate() {
		return itemClRate;
	}
	public void setItemClRate(Float itemClRate) {
		this.itemClRate = itemClRate;
	}
	public Float getItemClQty() {
		return itemClQty;
	}
	public void setItemClQty(Float itemClQty) {
		this.itemClQty = itemClQty;
	}
	public String getItemDate() {
		return itemDate;
	}
	public void setItemDate(String itemDate) {
		this.itemDate = itemDate;
	}
	public Float getItemWt() {
		return itemWt;
	}
	public void setItemWt(Float itemWt) {
		this.itemWt = itemWt;
	}
	public Float getItemMinLevel() {
		return itemMinLevel;
	}
	public void setItemMinLevel(Float itemMinLevel) {
		this.itemMinLevel = itemMinLevel;
	}
	public Float getItemMaxLevel() {
		return itemMaxLevel;
	}
	public void setItemMaxLevel(Float itemMaxLevel) {
		this.itemMaxLevel = itemMaxLevel;
	}
	public Float getItemRodLevel() {
		return itemRodLevel;
	}
	public void setItemRodLevel(Float itemRodLevel) {
		this.itemRodLevel = itemRodLevel;
	}
	public String getItemLocation() {
		return itemLocation;
	}
	public void setItemLocation(String itemLocation) {
		this.itemLocation = itemLocation;
	}
	public String getItemAbc() {
		return itemAbc;
	}
	public void setItemAbc(String itemAbc) {
		this.itemAbc = itemAbc;
	}
	public int getItemIsCritical() {
		return itemIsCritical;
	}
	public void setItemIsCritical(int itemIsCritical) {
		this.itemIsCritical = itemIsCritical;
	}
	public int getItemIsCons() {
		return itemIsCons;
	}
	public void setItemIsCons(int itemIsCons) {
		this.itemIsCons = itemIsCons;
	}
	public int getItemIsCapital() {
		return itemIsCapital;
	}
	public void setItemIsCapital(int itemIsCapital) {
		this.itemIsCapital = itemIsCapital;
	}
	public String getItemSchd() {
		return itemSchd;
	}
	public void setItemSchd(String itemSchd) {
		this.itemSchd = itemSchd;
	}
	public String getItemLife() {
		return itemLife;
	}
	public void setItemLife(String itemLife) {
		this.itemLife = itemLife;
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
	public String getCatDesc() {
		return catDesc;
	}
	public void setCatDesc(String catDesc) {
		this.catDesc = catDesc;
	}
	public String getGrpCode() {
		return grpCode;
	}
	public void setGrpCode(String grpCode) {
		this.grpCode = grpCode;
	}
	public String getSubgrpDesc() {
		return subgrpDesc;
	}
	public void setSubgrpDesc(String subgrpDesc) {
		this.subgrpDesc = subgrpDesc;
	}
	@Override
	public String toString() {
		return "GetItem [itemId=" + itemId + ", itemCode=" + itemCode + ", itemDesc=" + itemDesc + ", itemDesc2="
				+ itemDesc2 + ", itemDesc3=" + itemDesc3 + ", itemUom=" + itemUom + ", itemUom2=" + itemUom2
				+ ", catId=" + catId + ", grpId=" + grpId + ", subGrpId=" + subGrpId + ", itemOpRate=" + itemOpRate
				+ ", itemOpQty=" + itemOpQty + ", itemClRate=" + itemClRate + ", itemClQty=" + itemClQty + ", itemDate="
				+ itemDate + ", itemWt=" + itemWt + ", itemMinLevel=" + itemMinLevel + ", itemMaxLevel=" + itemMaxLevel
				+ ", itemRodLevel=" + itemRodLevel + ", itemLocation=" + itemLocation + ", itemAbc=" + itemAbc
				+ ", itemIsCritical=" + itemIsCritical + ", itemIsCons=" + itemIsCons + ", itemIsCapital="
				+ itemIsCapital + ", itemSchd=" + itemSchd + ", itemLife=" + itemLife + ", isUsed=" + isUsed
				+ ", createdIn=" + createdIn + ", deletedIn=" + deletedIn + ", catDesc=" + catDesc + ", grpCode="
				+ grpCode + ", subgrpDesc=" + subgrpDesc + "]";
	}
	
	

}
