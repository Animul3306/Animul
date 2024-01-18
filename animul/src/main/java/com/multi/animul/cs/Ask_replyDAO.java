package com.multi.animul.cs;

import java.util.List;

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
	
	public int delete(Ask_replyVO vo) {
		int result = my.delete("ask_reply.delete", vo);
		return result;
		}
	
	public int update(Ask_replyVO vo) {
		int result = my.update("ask_reply.update", vo);
		return result;
		}
	
	public List<Ask_replyVO> list(int ask_id) {
	return my.selectList("ask_reply.list", ask_id);
	
	}
	
	public Ask_replyVO one(Ask_replyVO vo) {
	Ask_replyVO vo3 =my.selectOne("ask_reply.one", vo);
	return vo3;
	}
	
	
	
}
