package com.multi.animul.diagnosis;

public class Receipt_itemVO {
	private int receipt_item_id;
	private String receipt_item_receiptid;
	private String receipt_item_diagnosisname;
	private int receipt_item_price;
	private String receipt_address;
	private int maxPrice;
	private int avgPrice;
	private int minPrice;	
	
	public int getReceipt_item_id() {
		return receipt_item_id;
	}
	public void setReceipt_item_id(int receipt_item_id) {
		this.receipt_item_id = receipt_item_id;
	}
	public String getReceipt_item_receiptid() {
		return receipt_item_receiptid;
	}
	public void setReceipt_item_receiptid(String receipt_item_receiptid) {
		this.receipt_item_receiptid = receipt_item_receiptid;
	}
	public String getReceipt_item_diagnosisname() {
		return receipt_item_diagnosisname;
	}
	public void setReceipt_item_diagnosisname(String receipt_item_diagnosisname) {
		this.receipt_item_diagnosisname = receipt_item_diagnosisname;
	}
	public int getReceipt_item_price() {
		return receipt_item_price;
	}
	public void setReceipt_item_price(int receipt_item_price) {
		this.receipt_item_price = receipt_item_price;
	}
	public String getReceipt_address() {
		return receipt_address;
	}
	public void setReceipt_address(String receipt_address) {
		this.receipt_address = receipt_address;
	}
	public int getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}
	public int getAvgPrice() {
		return avgPrice;
	}
	public void setAvgPrice(int avgPrice) {
		this.avgPrice = avgPrice;
	}
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	
	@Override
	public String toString() {
		return "Receipt_itemVO [receipt_item_id=" + receipt_item_id + ", receipt_item_receiptid="
				+ receipt_item_receiptid + ", receipt_item_diagnosisname=" + receipt_item_diagnosisname
				+ ", receipt_item_price=" + receipt_item_price + ", receipt_address=" + receipt_address + ", maxPrice="
				+ maxPrice + ", avgPrice=" + avgPrice + ", minPrice=" + minPrice + "]";
	}	
	
}
