package com.ats.tril.model;
 
public class RmRateVerificationRecord {
	
	  
	private int rvrId; 
	private int rmId; 
	private int suppId; 
	private String rateDate; 
	private float rateTaxExtra; 
	private float rateTaxIncl; 
	private int extra1; 
	private int extra2; 
	private String varchar1; 
	private String varchar2;
	public int getRvrId() {
		return rvrId;
	}
	public void setRvrId(int rvrId) {
		this.rvrId = rvrId;
	}
	public int getRmId() {
		return rmId;
	}
	public void setRmId(int rmId) {
		this.rmId = rmId;
	}
	public int getSuppId() {
		return suppId;
	}
	public void setSuppId(int suppId) {
		this.suppId = suppId;
	}
	public String getRateDate() {
		return rateDate;
	}
	public void setRateDate(String rateDate) {
		this.rateDate = rateDate;
	}
	public float getRateTaxExtra() {
		return rateTaxExtra;
	}
	public void setRateTaxExtra(float rateTaxExtra) {
		this.rateTaxExtra = rateTaxExtra;
	}
	public float getRateTaxIncl() {
		return rateTaxIncl;
	}
	public void setRateTaxIncl(float rateTaxIncl) {
		this.rateTaxIncl = rateTaxIncl;
	}
	public int getExtra1() {
		return extra1;
	}
	public void setExtra1(int extra1) {
		this.extra1 = extra1;
	}
	public int getExtra2() {
		return extra2;
	}
	public void setExtra2(int extra2) {
		this.extra2 = extra2;
	}
	public String getVarchar1() {
		return varchar1;
	}
	public void setVarchar1(String varchar1) {
		this.varchar1 = varchar1;
	}
	public String getVarchar2() {
		return varchar2;
	}
	public void setVarchar2(String varchar2) {
		this.varchar2 = varchar2;
	}
	@Override
	public String toString() {
		return "RmRateVerificationRecord [rvrId=" + rvrId + ", rmId=" + rmId + ", suppId=" + suppId + ", rateDate="
				+ rateDate + ", rateTaxExtra=" + rateTaxExtra + ", rateTaxIncl=" + rateTaxIncl + ", extra1=" + extra1
				+ ", extra2=" + extra2 + ", varchar1=" + varchar1 + ", varchar2=" + varchar2 + "]";
	}
	
	

}
