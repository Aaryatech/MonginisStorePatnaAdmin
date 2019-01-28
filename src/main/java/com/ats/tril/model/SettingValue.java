package com.ats.tril.model;
 

public class SettingValue {

	 
	private int settingId; 
	private String name; 
	private String value;
	public int getSettingId() {
		return settingId;
	}
	public void setSettingId(int settingId) {
		this.settingId = settingId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "SettingValue [settingId=" + settingId + ", name=" + name + ", value=" + value + "]";
	}
	
	
	
}
