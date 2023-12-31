package com.multi.animul.cs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.animul.bbs.BbsVO;

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
	
	public List<AskVO> list() {
		List<AskVO> list = my.selectList("ask.list");
		return list;
	}
	
	public AskVO one(AskVO vo) {
		AskVO vo2 = my.selectOne("ask.one", vo);
		return vo2;
	}
	
	
}
