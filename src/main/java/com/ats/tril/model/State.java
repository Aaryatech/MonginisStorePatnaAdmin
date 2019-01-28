package com.ats.tril.model;

public class State {

	private int stateId;

	private String stateCode;

	private String stateName;

	private int isUsed;

	public int getStateId() {
		return stateId;
	}

	public void setStateId(int stateId) {
		this.stateId = stateId;
	}

	public String getStateCode() {
		return stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "State [stateId=" + stateId + ", stateCode=" + stateCode + ", stateName=" + stateName + ", isUsed="
				+ isUsed + "]";
	}

}
