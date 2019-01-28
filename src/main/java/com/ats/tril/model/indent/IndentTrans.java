package com.ats.tril.model.indent;

import java.sql.Date;
public class IndentTrans {
	
	private int indDId;

	private int indMId;
	
	private String indMNo;
	
	private String indMDate;
	
	private int itemId;
	
	private float indQty;
	
	private String indItemUom;
	
	private String indItemDesc;
	
	private float indItemCurstk;
	
	private int indItemSchd;
	
	private Date indItemSchddt;
	
	private String indRemark;
	
	private int indDStatus;
	
	private float	indFyr;
	
	private int delStatus;
	
	
	private String indApr1Date;
	
	private String indApr2Date;
	
	

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getIndDId() {
		return indDId;
	}

	public int getIndMId() {
		return indMId;
	}

	public String getIndMNo() {
		return indMNo;
	}

	
	public String getIndMDate() {
		return indMDate;
	}

	public void setIndMDate(String indMDate) {
		this.indMDate = indMDate;
	}

	public int getItemId() {
		return itemId;
	}

	public float getIndQty() {
		return indQty;
	}

	public String getIndItemUom() {
		return indItemUom;
	}

	public String getIndItemDesc() {
		return indItemDesc;
	}

	public float getIndItemCurstk() {
		return indItemCurstk;
	}

	public int getIndItemSchd() {
		return indItemSchd;
	}

	public Date getIndItemSchddt() {
		return indItemSchddt;
	}

	public String getIndRemark() {
		return indRemark;
	}

	public int getIndDStatus() {
		return indDStatus;
	}

	public float getIndFyr() {
		return indFyr;
	}

	public void setIndDId(int indDId) {
		this.indDId = indDId;
	}

	public void setIndMId(int indMId) {
		this.indMId = indMId;
	}

	public void setIndMNo(String indMNo) {
		this.indMNo = indMNo;
	}

	
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public void setIndQty(float indQty) {
		this.indQty = indQty;
	}

	public void setIndItemUom(String indItemUom) {
		this.indItemUom = indItemUom;
	}

	public void setIndItemDesc(String indItemDesc) {
		this.indItemDesc = indItemDesc;
	}

	public void setIndItemCurstk(float indItemCurstk) {
		this.indItemCurstk = indItemCurstk;
	}

	public void setIndItemSchd(int indItemSchd) {
		this.indItemSchd = indItemSchd;
	}

	public void setIndItemSchddt(Date indItemSchddt) {
		this.indItemSchddt = indItemSchddt;
	}

	public void setIndRemark(String indRemark) {
		this.indRemark = indRemark;
	}

	public void setIndDStatus(int indDStatus) {
		this.indDStatus = indDStatus;
	}

	public void setIndFyr(float indFyr) {
		this.indFyr = indFyr;
	}
	
	
	
	
	public String getIndApr1Date() {
		return indApr1Date;
	}

	public String getIndApr2Date() {
		return indApr2Date;
	}

	public void setIndApr1Date(String indApr1Date) {
		this.indApr1Date = indApr1Date;
	}

	public void setIndApr2Date(String indApr2Date) {
		this.indApr2Date = indApr2Date;
	}

	@Override
	public String toString() {
		return "IndentTrans [indDId=" + indDId + ", indMId=" + indMId + ", indMNo=" + indMNo + ", indMDate=" + indMDate
				+ ", itemId=" + itemId + ", indQty=" + indQty + ", indItemUom=" + indItemUom + ", indItemDesc="
				+ indItemDesc + ", indItemCurstk=" + indItemCurstk + ", indItemSchd=" + indItemSchd + ", indItemSchddt="
				+ indItemSchddt + ", indRemark=" + indRemark + ", indDStatus=" + indDStatus + ", indFyr=" + indFyr
				+ ", delStatus=" + delStatus + ", indApr1Date=" + indApr1Date + ", indApr2Date=" + indApr2Date + "]";
	}

}
