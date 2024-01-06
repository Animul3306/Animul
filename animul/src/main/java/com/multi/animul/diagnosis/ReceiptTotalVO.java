package com.multi.animul.diagnosis;

public class ReceiptTotalVO {
	private int gugunAvgPrice;
	private int gugunMinPrice;
	private int gugunMaxPrice;
	private int sidoAvgPrice;
	private int sidoMinPrice;
	private int sidoMaxPrice;
	private int allAvgPrice;
	private int allMinPrice;
	private int allMaxPrice;
	private String gugunAddress;
	private String sidoAddress;
	private String receipt_item_diagnosisname;
	public int getGugunAvgPrice() {
		return gugunAvgPrice;
	}
	public void setGugunAvgPrice(int gugunAvgPrice) {
		this.gugunAvgPrice = gugunAvgPrice;
	}
	public int getGugunMinPrice() {
		return gugunMinPrice;
	}
	public void setGugunMinPrice(int gugunMinPrice) {
		this.gugunMinPrice = gugunMinPrice;
	}
	public int getGugunMaxPrice() {
		return gugunMaxPrice;
	}
	public void setGugunMaxPrice(int gugunMaxPrice) {
		this.gugunMaxPrice = gugunMaxPrice;
	}
	public int getSidoAvgPrice() {
		return sidoAvgPrice;
	}
	public void setSidoAvgPrice(int sidoAvgPrice) {
		this.sidoAvgPrice = sidoAvgPrice;
	}
	public int getSidoMinPrice() {
		return sidoMinPrice;
	}
	public void setSidoMinPrice(int sidoMinPrice) {
		this.sidoMinPrice = sidoMinPrice;
	}
	public int getSidoMaxPrice() {
		return sidoMaxPrice;
	}
	public void setSidoMaxPrice(int sidoMaxPrice) {
		this.sidoMaxPrice = sidoMaxPrice;
	}
	public int getAllAvgPrice() {
		return allAvgPrice;
	}
	public void setAllAvgPrice(int allAvgPrice) {
		this.allAvgPrice = allAvgPrice;
	}
	public int getAllMinPrice() {
		return allMinPrice;
	}
	public void setAllMinPrice(int allMinPrice) {
		this.allMinPrice = allMinPrice;
	}
	public int getAllMaxPrice() {
		return allMaxPrice;
	}
	public void setAllMaxPrice(int allMaxPrice) {
		this.allMaxPrice = allMaxPrice;
	}
	public String getGugunAddress() {
		return gugunAddress;
	}
	public void setGugunAddress(String gugunAddress) {
		this.gugunAddress = gugunAddress;
	}
	public String getSidoAddress() {
		return sidoAddress;
	}
	public void setSidoAddress(String sidoAddress) {
		this.sidoAddress = sidoAddress;
	}
	public String getReceipt_item_diagnosisname() {
		return receipt_item_diagnosisname;
	}
	public void setReceipt_item_diagnosisname(String receipt_item_diagnosisname) {
		this.receipt_item_diagnosisname = receipt_item_diagnosisname;
	}
	
	@Override
	public String toString() {
		return "ReceiptTotalVO [gugunAvgPrice=" + gugunAvgPrice + ", gugunMinPrice=" + gugunMinPrice
				+ ", gugunMaxPrice=" + gugunMaxPrice + ", sidoAvgPrice=" + sidoAvgPrice + ", sidoMinPrice="
				+ sidoMinPrice + ", sidoMaxPrice=" + sidoMaxPrice + ", allAvgPrice=" + allAvgPrice + ", allMinPrice="
				+ allMinPrice + ", allMaxPrice=" + allMaxPrice + ", gugunAddress=" + gugunAddress + ", sidoAddress="
				+ sidoAddress + ", receipt_item_diagnosisname=" + receipt_item_diagnosisname + "]";
	}
	
}
