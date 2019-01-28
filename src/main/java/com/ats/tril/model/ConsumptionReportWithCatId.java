package com.ats.tril.model;

import java.util.List;

public class ConsumptionReportWithCatId {
	
	private int typeId; 
	private String typeName; 
	private List<ConsumptionReportData> consumptionReportList;
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public List<ConsumptionReportData> getConsumptionReportList() {
		return consumptionReportList;
	}
	public void setConsumptionReportList(List<ConsumptionReportData> consumptionReportList) {
		this.consumptionReportList = consumptionReportList;
	}
	@Override
	public String toString() {
		return "ConsumptionReportWithCatId [typeId=" + typeId + ", typeName=" + typeName + ", consumptionReportList="
				+ consumptionReportList + "]";
	}
	
	

}
