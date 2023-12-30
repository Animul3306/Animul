package com.multi.animul.cs;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Ask_replyDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(Ask_replyVO vo) {
	int result = my.insert("ask_reply.insert", vo);
	return result;
	}
	
}
