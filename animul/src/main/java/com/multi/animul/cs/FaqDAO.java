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
	
	public int delete(FaqVO vo) {
		int result = my.delete("faq.delete", vo);
		return result;
		}
	
	public int update(FaqVO vo) {
		int result = my.update("faq.update", vo);
		return result;
		}
	
}
