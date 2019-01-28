package com.ats.tril.model.doc;

public class DocumentBean{

	private int id;
	
	private int docId;
	
	private String docName;
	
	private String docIsoSerialNumber;
	
	private String docPrefix;
	
	private String docPostfix;
	
	private String fyYear;
	
	private String fromDate;
	
	private String toDate;
	
	private String code;
	
	private int delStatus;
	
	private SubDocument subDocument;
	
	 
 
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public SubDocument getSubDocument() {
		return subDocument;
	}

	public void setSubDocument(SubDocument subDocument) {
		this.subDocument = subDocument;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDocId() {
		return docId;
	}

	public void setDocId(int docId) {
		this.docId = docId;
	}

	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public String getDocIsoSerialNumber() {
		return docIsoSerialNumber;
	}

	public void setDocIsoSerialNumber(String docIsoSerialNumber) {
		this.docIsoSerialNumber = docIsoSerialNumber;
	}

	public String getDocPrefix() {
		return docPrefix;
	}

	public void setDocPrefix(String docPrefix) {
		this.docPrefix = docPrefix;
	}

	public String getDocPostfix() {
		return docPostfix;
	}

	public void setDocPostfix(String docPostfix) {
		this.docPostfix = docPostfix;
	}

	public String getFyYear() {
		return fyYear;
	}

	public void setFyYear(String fyYear) {
		this.fyYear = fyYear;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "DocumentBean [id=" + id + ", docId=" + docId + ", docName=" + docName + ", docIsoSerialNumber="
				+ docIsoSerialNumber + ", docPrefix=" + docPrefix + ", docPostfix=" + docPostfix + ", fyYear=" + fyYear
				+ ", fromDate=" + fromDate + ", toDate=" + toDate + ", delStatus=" + delStatus + "]";
	}
	
}
