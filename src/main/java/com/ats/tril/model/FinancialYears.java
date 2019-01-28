package com.ats.tril.model;

public class FinancialYears {
	private int finYearId;

	private String finYear;

	private int isUsed;

	public int getFinYearId() {
		return finYearId;
	}

	public void setFinYearId(int finYearId) {
		this.finYearId = finYearId;
	}

	public String getFinYear() {
		return finYear;
	}

	public void setFinYear(String finYear) {
		this.finYear = finYear;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "FinancialYears [finYearId=" + finYearId + ", finYear=" + finYear + ", isUsed=" + isUsed + "]";
	}

}
