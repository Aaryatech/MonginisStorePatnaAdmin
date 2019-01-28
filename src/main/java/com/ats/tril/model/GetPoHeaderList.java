package com.ats.tril.model;
 
import java.util.List;
 

public class GetPoHeaderList {
	 
	private int poId; 
	private int poType; 
	private String poNo; 
	private String poDate; 
	private int vendId; 
	private String vendQuation; 
	private String vendQuationDate; 
	private float poBasicValue; 
	private float discValue; 
	private int poTaxId; 
	private float poTaxPer; 
	private float poTaxValue; 
	private float poPackPer; 
	private float poPackVal; 
	private String poPackRemark; 
	private float poInsuPer; 
	private float poInsuVal; 
	private String poInsuRemark; 
	private float poFrtPer; 
	private float poFrtVal; 
	private String poFrtRemark; 
	private float otherChargeBefore; 
	private String otherChargeBeforeRemark; 
	private float otherChargeAfter; 
	private String otherChargeAfterRemark; 
	private float totalValue; 
	private int deliveryId; 
	private int dispatchId; 
	private int paymentTermId; 
	private String poRemark; 
	private int poStatus; 
	private int prnStatus; 
	private int prnCopies; 
	private int indId; 
	private String indNo; 
	private int userId; 
	private int delStatus; 
	private int approvStatus; 
	private String vendorName; 
	List<GetPoDetailList> poDetailList;
	public int getPoId() {
		return poId;
	}
	public void setPoId(int poId) {
		this.poId = poId;
	}
	public int getPoType() {
		return poType;
	}
	public void setPoType(int poType) {
		this.poType = poType;
	}
	public String getPoNo() {
		return poNo;
	}
	public void setPoNo(String poNo) {
		this.poNo = poNo;
	}
	public String getPoDate() {
		return poDate;
	}
	public void setPoDate(String poDate) {
		this.poDate = poDate;
	}
	public int getVendId() {
		return vendId;
	}
	public void setVendId(int vendId) {
		this.vendId = vendId;
	}
	public String getVendQuation() {
		return vendQuation;
	}
	public void setVendQuation(String vendQuation) {
		this.vendQuation = vendQuation;
	}
	public String getVendQuationDate() {
		return vendQuationDate;
	}
	public void setVendQuationDate(String vendQuationDate) {
		this.vendQuationDate = vendQuationDate;
	}
	public float getPoBasicValue() {
		return poBasicValue;
	}
	public void setPoBasicValue(float poBasicValue) {
		this.poBasicValue = poBasicValue;
	}
	public float getDiscValue() {
		return discValue;
	}
	public void setDiscValue(float discValue) {
		this.discValue = discValue;
	}
	public int getPoTaxId() {
		return poTaxId;
	}
	public void setPoTaxId(int poTaxId) {
		this.poTaxId = poTaxId;
	}
	public float getPoTaxPer() {
		return poTaxPer;
	}
	public void setPoTaxPer(float poTaxPer) {
		this.poTaxPer = poTaxPer;
	}
	public float getPoTaxValue() {
		return poTaxValue;
	}
	public void setPoTaxValue(float poTaxValue) {
		this.poTaxValue = poTaxValue;
	}
	public float getPoPackPer() {
		return poPackPer;
	}
	public void setPoPackPer(float poPackPer) {
		this.poPackPer = poPackPer;
	}
	public float getPoPackVal() {
		return poPackVal;
	}
	public void setPoPackVal(float poPackVal) {
		this.poPackVal = poPackVal;
	}
	public String getPoPackRemark() {
		return poPackRemark;
	}
	public void setPoPackRemark(String poPackRemark) {
		this.poPackRemark = poPackRemark;
	}
	public float getPoInsuPer() {
		return poInsuPer;
	}
	public void setPoInsuPer(float poInsuPer) {
		this.poInsuPer = poInsuPer;
	}
	public float getPoInsuVal() {
		return poInsuVal;
	}
	public void setPoInsuVal(float poInsuVal) {
		this.poInsuVal = poInsuVal;
	}
	public String getPoInsuRemark() {
		return poInsuRemark;
	}
	public void setPoInsuRemark(String poInsuRemark) {
		this.poInsuRemark = poInsuRemark;
	}
	public float getPoFrtPer() {
		return poFrtPer;
	}
	public void setPoFrtPer(float poFrtPer) {
		this.poFrtPer = poFrtPer;
	}
	public float getPoFrtVal() {
		return poFrtVal;
	}
	public void setPoFrtVal(float poFrtVal) {
		this.poFrtVal = poFrtVal;
	}
	public String getPoFrtRemark() {
		return poFrtRemark;
	}
	public void setPoFrtRemark(String poFrtRemark) {
		this.poFrtRemark = poFrtRemark;
	}
	public float getOtherChargeBefore() {
		return otherChargeBefore;
	}
	public void setOtherChargeBefore(float otherChargeBefore) {
		this.otherChargeBefore = otherChargeBefore;
	}
	public String getOtherChargeBeforeRemark() {
		return otherChargeBeforeRemark;
	}
	public void setOtherChargeBeforeRemark(String otherChargeBeforeRemark) {
		this.otherChargeBeforeRemark = otherChargeBeforeRemark;
	}
	public float getOtherChargeAfter() {
		return otherChargeAfter;
	}
	public void setOtherChargeAfter(float otherChargeAfter) {
		this.otherChargeAfter = otherChargeAfter;
	}
	public String getOtherChargeAfterRemark() {
		return otherChargeAfterRemark;
	}
	public void setOtherChargeAfterRemark(String otherChargeAfterRemark) {
		this.otherChargeAfterRemark = otherChargeAfterRemark;
	}
	public float getTotalValue() {
		return totalValue;
	}
	public void setTotalValue(float totalValue) {
		this.totalValue = totalValue;
	}
	public int getDeliveryId() {
		return deliveryId;
	}
	public void setDeliveryId(int deliveryId) {
		this.deliveryId = deliveryId;
	}
	public int getDispatchId() {
		return dispatchId;
	}
	public void setDispatchId(int dispatchId) {
		this.dispatchId = dispatchId;
	}
	public int getPaymentTermId() {
		return paymentTermId;
	}
	public void setPaymentTermId(int paymentTermId) {
		this.paymentTermId = paymentTermId;
	}
	public String getPoRemark() {
		return poRemark;
	}
	public void setPoRemark(String poRemark) {
		this.poRemark = poRemark;
	}
	public int getPoStatus() {
		return poStatus;
	}
	public void setPoStatus(int poStatus) {
		this.poStatus = poStatus;
	}
	public int getPrnStatus() {
		return prnStatus;
	}
	public void setPrnStatus(int prnStatus) {
		this.prnStatus = prnStatus;
	}
	public int getPrnCopies() {
		return prnCopies;
	}
	public void setPrnCopies(int prnCopies) {
		this.prnCopies = prnCopies;
	}
	public int getIndId() {
		return indId;
	}
	public void setIndId(int indId) {
		this.indId = indId;
	}
	public String getIndNo() {
		return indNo;
	}
	public void setIndNo(String indNo) {
		this.indNo = indNo;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	public int getApprovStatus() {
		return approvStatus;
	}
	public void setApprovStatus(int approvStatus) {
		this.approvStatus = approvStatus;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public List<GetPoDetailList> getPoDetailList() {
		return poDetailList;
	}
	public void setPoDetailList(List<GetPoDetailList> poDetailList) {
		this.poDetailList = poDetailList;
	}
	@Override
	public String toString() {
		return "GetPoHeaderList [poId=" + poId + ", poType=" + poType + ", poNo=" + poNo + ", poDate=" + poDate
				+ ", vendId=" + vendId + ", vendQuation=" + vendQuation + ", vendQuationDate=" + vendQuationDate
				+ ", poBasicValue=" + poBasicValue + ", discValue=" + discValue + ", poTaxId=" + poTaxId + ", poTaxPer="
				+ poTaxPer + ", poTaxValue=" + poTaxValue + ", poPackPer=" + poPackPer + ", poPackVal=" + poPackVal
				+ ", poPackRemark=" + poPackRemark + ", poInsuPer=" + poInsuPer + ", poInsuVal=" + poInsuVal
				+ ", poInsuRemark=" + poInsuRemark + ", poFrtPer=" + poFrtPer + ", poFrtVal=" + poFrtVal
				+ ", poFrtRemark=" + poFrtRemark + ", otherChargeBefore=" + otherChargeBefore
				+ ", otherChargeBeforeRemark=" + otherChargeBeforeRemark + ", otherChargeAfter=" + otherChargeAfter
				+ ", otherChargeAfterRemark=" + otherChargeAfterRemark + ", totalValue=" + totalValue + ", deliveryId="
				+ deliveryId + ", dispatchId=" + dispatchId + ", paymentTermId=" + paymentTermId + ", poRemark="
				+ poRemark + ", poStatus=" + poStatus + ", prnStatus=" + prnStatus + ", prnCopies=" + prnCopies
				+ ", indId=" + indId + ", indNo=" + indNo + ", userId=" + userId + ", delStatus=" + delStatus
				+ ", approvStatus=" + approvStatus + ", vendorName=" + vendorName + ", poDetailList=" + poDetailList
				+ "]";
	}
	
	

}
