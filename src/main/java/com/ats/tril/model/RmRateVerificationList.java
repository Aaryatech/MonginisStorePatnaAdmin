package com.ats.tril.model;
 
public class RmRateVerificationList {
	 
	private int rmRateVerId; 
	private int rmId; 
	private int suppId; 
	private String rateDate; 
	private float rateTaxExtra; 
	private float rateTaxIncl; 
	private int taxId; 
	private String date1; 
	private float rate1TaxExtra; 
	private float rate1TaxIncl; 
	private String date2; 
	private float rate2TaxExtra; 
	private float rate2TaxIncl; 
	private int grpId;
	public int getRmRateVerId() {
		return rmRateVerId;
	}
	public void setRmRateVerId(int rmRateVerId) {
		this.rmRateVerId = rmRateVerId;
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
	public int getTaxId() {
		return taxId;
	}
	public void setTaxId(int taxId) {
		this.taxId = taxId;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public float getRate1TaxExtra() {
		return rate1TaxExtra;
	}
	public void setRate1TaxExtra(float rate1TaxExtra) {
		this.rate1TaxExtra = rate1TaxExtra;
	}
	public float getRate1TaxIncl() {
		return rate1TaxIncl;
	}
	public void setRate1TaxIncl(float rate1TaxIncl) {
		this.rate1TaxIncl = rate1TaxIncl;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}
	public float getRate2TaxExtra() {
		return rate2TaxExtra;
	}
	public void setRate2TaxExtra(float rate2TaxExtra) {
		this.rate2TaxExtra = rate2TaxExtra;
	}
	public float getRate2TaxIncl() {
		return rate2TaxIncl;
	}
	public void setRate2TaxIncl(float rate2TaxIncl) {
		this.rate2TaxIncl = rate2TaxIncl;
	}
	public int getGrpId() {
		return grpId;
	}
	public void setGrpId(int grpId) {
		this.grpId = grpId;
	}
	@Override
	public String toString() {
		return "RmRateVerificationList [rmRateVerId=" + rmRateVerId + ", rmId=" + rmId + ", suppId=" + suppId
				+ ", rateDate=" + rateDate + ", rateTaxExtra=" + rateTaxExtra + ", rateTaxIncl=" + rateTaxIncl
				+ ", taxId=" + taxId + ", date1=" + date1 + ", rate1TaxExtra=" + rate1TaxExtra + ", rate1TaxIncl="
				+ rate1TaxIncl + ", date2=" + date2 + ", rate2TaxExtra=" + rate2TaxExtra + ", rate2TaxIncl="
				+ rate2TaxIncl + ", grpId=" + grpId + "]";
	}
	
	

}
