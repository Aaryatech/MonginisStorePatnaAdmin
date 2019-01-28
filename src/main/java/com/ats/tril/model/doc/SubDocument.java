package com.ats.tril.model.doc;



public class SubDocument {

	private int subDocId;
	
	private int mId;
	
	private int docId;
	
	private String subDocName;
	
	private int catId;
	
	private int counter;
	
	private String categoryPrefix;
	
	private String categoryPostfix;
	
	private String printPrefix;
	
	private String printPostfix;
	
	private int delStatus;

	public int getSubDocId() {
		return subDocId;
	}

	public void setSubDocId(int subDocId) {
		this.subDocId = subDocId;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public int getDocId() {
		return docId;
	}

	public void setDocId(int docId) {
		this.docId = docId;
	}

	public String getSubDocName() {
		return subDocName;
	}

	public void setSubDocName(String subDocName) {
		this.subDocName = subDocName;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public int getCounter() {
		return counter;
	}

	public void setCounter(int counter) {
		this.counter = counter;
	}

	public String getCategoryPrefix() {
		return categoryPrefix;
	}

	public void setCategoryPrefix(String categoryPrefix) {
		this.categoryPrefix = categoryPrefix;
	}

	public String getCategoryPostfix() {
		return categoryPostfix;
	}

	public void setCategoryPostfix(String categoryPostfix) {
		this.categoryPostfix = categoryPostfix;
	}

	public String getPrintPrefix() {
		return printPrefix;
	}

	public void setPrintPrefix(String printPrefix) {
		this.printPrefix = printPrefix;
	}

	public String getPrintPostfix() {
		return printPostfix;
	}

	public void setPrintPostfix(String printPostfix) {
		this.printPostfix = printPostfix;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "SubDocument [subDocId=" + subDocId + ", mId=" + mId + ", docId=" + docId + ", subDocName=" + subDocName
				+ ", catId=" + catId + ", counter=" + counter + ", categoryPrefix=" + categoryPrefix
				+ ", categoryPostfix=" + categoryPostfix + ", printPrefix=" + printPrefix + ", printPostfix="
				+ printPostfix + ", delStatus=" + delStatus + "]";
	}
	
	
}
