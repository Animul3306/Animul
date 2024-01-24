package com.multi.animul.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypetDAO {
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(MypetVO vo) {
		return my.insert("mypet.insert", vo);
	}
	
	public int update(MypetVO vo) {
		return my.update("mypet.update", vo);
	}

	public List<MypetVO> all() {
		return my.selectList("mypet.all");
	}
	
	public int delete(MypetVO vo) {
		return my.delete("mypet.delete", vo);
	}
	
	public int count() {
		return my.selectOne("mypet.count");
	}

	public List<MypetVO> simple_inquiry(MypetVO vo) {
		return my.selectList("mypet.simple_inquiry", vo);
	}

	public MypetVO inquiry(MypetVO vo) {
		return my.selectOne("mypet.inquiry", vo);
	}
}
