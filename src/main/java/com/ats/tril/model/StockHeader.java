package com.ats.tril.model;

import java.util.List;
 

public class StockHeader {
	
	 
	private int stockHeaderId; 
	private int stockCategory; 
	private int month; 
	private int year; 
	private int status; 
	private String date; 
	private int delStatus; 
	List<StockDetail> stockDetailList;
	public int getStockHeaderId() {
		return stockHeaderId;
	}
	public void setStockHeaderId(int stockHeaderId) {
		this.stockHeaderId = stockHeaderId;
	}
	public int getStockCategory() {
		return stockCategory;
	}
	public void setStockCategory(int stockCategory) {
		this.stockCategory = stockCategory;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	public List<StockDetail> getStockDetailList() {
		return stockDetailList;
	}
	public void setStockDetailList(List<StockDetail> stockDetailList) {
		this.stockDetailList = stockDetailList;
	}
	@Override
	public String toString() {
		return "StockHeader [stockHeaderId=" + stockHeaderId + ", stockCategory=" + stockCategory + ", month=" + month
				+ ", year=" + year + ", status=" + status + ", date=" + date + ", delStatus=" + delStatus
				+ ", stockDetailList=" + stockDetailList + "]";
	}
	
	

}
