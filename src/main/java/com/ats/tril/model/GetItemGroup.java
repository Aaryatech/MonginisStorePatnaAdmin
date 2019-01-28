package com.ats.tril.model;

public class GetItemGroup {
	
	private int grpId;

	private int catId;
	
	private String catDesc;

	private String grpCode;

	private String grpDesc;

	private String grpValueyn;

	private int isUsed;

	public int getGrpId() {
		return grpId;
	}

	public void setGrpId(int grpId) {
		this.grpId = grpId;
	}

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

	public String getGrpCode() {
		return grpCode;
	}

	public void setGrpCode(String grpCode) {
		this.grpCode = grpCode;
	}

	public String getGrpDesc() {
		return grpDesc;
	}

	public void setGrpDesc(String grpDesc) {
		this.grpDesc = grpDesc;
	}

	public String getGrpValueyn() {
		return grpValueyn;
	}

	public void setGrpValueyn(String grpValueyn) {
		this.grpValueyn = grpValueyn;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "GetItemGroup [grpId=" + grpId + ", catId=" + catId + ", catDesc=" + catDesc + ", grpCode=" + grpCode
				+ ", grpDesc=" + grpDesc + ", grpValueyn=" + grpValueyn + ", isUsed=" + isUsed + "]";
	}
	

}
