package com.multi.animul.diagnosis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReceiptDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int  insert(ReceiptVO receiptVO) {
		return my.insert("receipt.insert", receiptVO);
	}
	
	public int review(ReceiptVO receiptVO) {
		return my.insert("receipt.review", receiptVO);
	}
	
	public ReceiptVO one(ReceiptVO receiptVO) {
		return my.selectOne("receipt.one", receiptVO);
	}
	
	public List<ReceiptVO> list(){
		return my.selectList("receipt.list");
	}
}
