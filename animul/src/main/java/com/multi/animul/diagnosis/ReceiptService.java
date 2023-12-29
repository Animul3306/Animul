package com.multi.animul.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReceiptService {
	
	@Autowired
	ReceiptDAO receiptDAO;
	
	public int  insert(ReceiptVO receiptVO) {
		return receiptDAO.insert(receiptVO);
	}
	
	public int review(ReceiptVO receiptVO) {
		return receiptDAO.review(receiptVO);
	}
	
	public ReceiptVO one(ReceiptVO receiptVO) {
		return receiptDAO.one(receiptVO);
	}
	
	public List<ReceiptVO> list(){
		return receiptDAO.list();
	}
}
