package com.multi.animul.cs;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(FaqVO vo) {
		int result =my.insert("faq.insert", vo);
		return result;
	}
	
	
}
