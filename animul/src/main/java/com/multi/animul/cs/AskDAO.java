package com.multi.animul.cs;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AskDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(AskVO vo) {
		int result = my.insert("ask.insert", vo);
		return result;
	}
	
	public int delete(AskVO vo) {
		int result = my.delete("ask.delete", vo);
		return result;
		}
	
	public int update(AskVO vo) {
		int result = my.update("ask.update", vo);
		return result;
		}
	
}
