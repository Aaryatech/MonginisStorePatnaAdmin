package com.ats.tril.model;

import java.util.List;

public class MrnMonthWiseList {
	
	private List<MonthCategoryWiseMrnReport> monthList;
	private List<MonthItemWiseMrnReport> itemWiseMonthList;
	public List<MonthCategoryWiseMrnReport> getMonthList() {
		return monthList;
	}
	public void setMonthList(List<MonthCategoryWiseMrnReport> monthList) {
		this.monthList = monthList;
	}
	public List<MonthItemWiseMrnReport> getItemWiseMonthList() {
		return itemWiseMonthList;
	}
	public void setItemWiseMonthList(List<MonthItemWiseMrnReport> itemWiseMonthList) {
		this.itemWiseMonthList = itemWiseMonthList;
	}
	@Override
	public String toString() {
		return "MrnMonthWiseList [monthList=" + monthList + ", itemWiseMonthList=" + itemWiseMonthList + "]";
	}
	
	

}
