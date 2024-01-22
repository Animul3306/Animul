package com.multi.animul.diagnosis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Receipt_itemDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(Receipt_itemVO receipt_itemVO) {
		return my.insert("receipt_item.insert", receipt_itemVO);
	}
	
	public Receipt_itemVO one(Receipt_itemVO receipt_itemVO) {
		return my.selectOne("receipt_item.one", receipt_itemVO);
	}
	
	public List<Receipt_itemVO> itemList(Receipt_itemVO receipt_itemVO) {
		return my.selectList("receipt_item.itemList", receipt_itemVO);
	}
	

	
	public List<Receipt_itemVO> diagnosisList() {
		return my.selectList("receipt_item.diagnosisList");
	}
	
	public List<Receipt_itemVO> diagnosisMyList(ReceiptVO receiptVO) {
		return my.selectList("receipt_item.diagnosisMyList", receiptVO);
	}
	
	public ReceiptTotalVO totalPrice(ReceiptTotalVO receiptTotalVO) {
		return my.selectOne("receipt_item.totalPrice", receiptTotalVO);
	}
	
	public List<ReceiptTotalVO> avgPrice() {
		return my.selectList("receipt_item.avgPrice");
	}
}
