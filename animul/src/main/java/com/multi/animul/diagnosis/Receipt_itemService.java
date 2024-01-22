package com.multi.animul.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Receipt_itemService {
	
	@Autowired
	Receipt_itemDAO receipt_itemDAO;

	public int insert(Receipt_itemVO receipt_itemVO) {
		return receipt_itemDAO.insert(receipt_itemVO);
	}
	
	public Receipt_itemVO one(Receipt_itemVO receipt_itemVO) {
		return receipt_itemDAO.one(receipt_itemVO);
	}
	
	public List<Receipt_itemVO> itemList(Receipt_itemVO receipt_itemVO) {
		return receipt_itemDAO.itemList(receipt_itemVO);
	}
	
	public List<Receipt_itemVO> diagnosisList() {
		return receipt_itemDAO.diagnosisList();
	}
	
	public List<Receipt_itemVO> diagnosisMyList(ReceiptVO receiptVO){
		return receipt_itemDAO.diagnosisMyList(receiptVO);
	}
	
	public ReceiptTotalVO totalPrice(ReceiptTotalVO receiptTotalVO) {
		return receipt_itemDAO.totalPrice(receiptTotalVO);
	}
	
	public List<ReceiptTotalVO> avgPrice() {
		return receipt_itemDAO.avgPrice();
	}
}
