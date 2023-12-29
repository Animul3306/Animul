package com.multi.animul.diagnosis;

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
	
	public Receipt_itemVO list() {
		return my.selectOne("receipt_item.list");
	}
}
