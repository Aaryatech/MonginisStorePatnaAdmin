package com.ats.tril.model.doc;

import java.util.List;

public class IndentReport {

	
private Integer indMId;
private String indMNo;
private String indMDate;
private Integer indMType;
private Integer catId;
private Integer achdId;
private Integer indIsdev;
private String indRemark;
private Integer indIsmonthly;
private Integer indMStatus;
private Integer indFyr;
private Integer deptId;
private Integer subDeptId;
private String deptDesc;
private String subDeptDesc;
private String catDesc;
private String accHeadDesc;
private String typeName;
private List<IndentReportDetail> indentReportDetailList ;

public Integer getIndMId() {
	return indMId;
}
public void setIndMId(Integer indMId) {
	this.indMId = indMId;
}
public String getIndMNo() {
	return indMNo;
}
public void setIndMNo(String indMNo) {
	this.indMNo = indMNo;
}
public String getIndMDate() {
	return indMDate;
}
public void setIndMDate(String indMDate) {
	this.indMDate = indMDate;
}
public Integer getIndMType() {
	return indMType;
}
public void setIndMType(Integer indMType) {
	this.indMType = indMType;
}
public Integer getCatId() {
	return catId;
}
public void setCatId(Integer catId) {
	this.catId = catId;
}
public Integer getAchdId() {
	return achdId;
}
public void setAchdId(Integer achdId) {
	this.achdId = achdId;
}
public Integer getIndIsdev() {
	return indIsdev;
}
public void setIndIsdev(Integer indIsdev) {
	this.indIsdev = indIsdev;
}
public String getIndRemark() {
	return indRemark;
}
public void setIndRemark(String indRemark) {
	this.indRemark = indRemark;
}
public Integer getIndIsmonthly() {
	return indIsmonthly;
}
public void setIndIsmonthly(Integer indIsmonthly) {
	this.indIsmonthly = indIsmonthly;
}
public Integer getIndMStatus() {
	return indMStatus;
}
public void setIndMStatus(Integer indMStatus) {
	this.indMStatus = indMStatus;
}
public Integer getIndFyr() {
	return indFyr;
}
public void setIndFyr(Integer indFyr) {
	this.indFyr = indFyr;
}
public Integer getDeptId() {
	return deptId;
}
public void setDeptId(Integer deptId) {
	this.deptId = deptId;
}
public Integer getSubDeptId() {
	return subDeptId;
}
public void setSubDeptId(Integer subDeptId) {
	this.subDeptId = subDeptId;
}
public String getDeptDesc() {
	return deptDesc;
}
public void setDeptDesc(String deptDesc) {
	this.deptDesc = deptDesc;
}
public String getSubDeptDesc() {
	return subDeptDesc;
}
public void setSubDeptDesc(String subDeptDesc) {
	this.subDeptDesc = subDeptDesc;
}
public String getCatDesc() {
	return catDesc;
}
public void setCatDesc(String catDesc) {
	this.catDesc = catDesc;
}
public String getAccHeadDesc() {
	return accHeadDesc;
}
public void setAccHeadDesc(String accHeadDesc) {
	this.accHeadDesc = accHeadDesc;
}
public List<IndentReportDetail> getIndentReportDetailList() {
	return indentReportDetailList;
}
public void setIndentReportDetailList(List<IndentReportDetail> indentReportDetailList) {
	this.indentReportDetailList = indentReportDetailList;
}

public String getTypeName() {
	return typeName;
}
public void setTypeName(String typeName) {
	this.typeName = typeName;
}
@Override
public String toString() {
	return "IndentReport [indMId=" + indMId + ", indMNo=" + indMNo + ", indMDate=" + indMDate + ", indMType=" + indMType
			+ ", catId=" + catId + ", achdId=" + achdId + ", indIsdev=" + indIsdev + ", indRemark=" + indRemark
			+ ", indIsmonthly=" + indIsmonthly + ", indMStatus=" + indMStatus + ", indFyr=" + indFyr + ", deptId="
			+ deptId + ", subDeptId=" + subDeptId + ", deptDesc=" + deptDesc + ", subDeptDesc=" + subDeptDesc
			+ ", catDesc=" + catDesc + ", accHeadDesc=" + accHeadDesc + ", typeName=" + typeName
			+ ", indentReportDetailList=" + indentReportDetailList + "]";
}

	
	
}
