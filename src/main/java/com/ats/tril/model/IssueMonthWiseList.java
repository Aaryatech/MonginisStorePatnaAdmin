package com.ats.tril.model;

import java.util.List;

public class IssueMonthWiseList {
	
	private String fromDate;
	private List<MonthWiseIssueReport> monthList;
	private List<MonthSubDeptWiseIssueReport> monthSubDeptList;
	
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public List<MonthWiseIssueReport> getMonthList() {
		return monthList;
	}
	public void setMonthList(List<MonthWiseIssueReport> monthList) {
		this.monthList = monthList;
	}
	
	public List<MonthSubDeptWiseIssueReport> getMonthSubDeptList() {
		return monthSubDeptList;
	}
	public void setMonthSubDeptList(List<MonthSubDeptWiseIssueReport> monthSubDeptList) {
		this.monthSubDeptList = monthSubDeptList;
	}
	@Override
	public String toString() {
		return "IssueMonthWiseList [fromDate=" + fromDate + ", monthList=" + monthList + ", monthSubDeptList="
				+ monthSubDeptList + "]";
	}
	
	

}
