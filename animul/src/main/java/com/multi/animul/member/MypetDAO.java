package com.multi.animul.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypetDAO {
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(MypetVO vo) {
		my.insert("mypet.insert", vo);
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
}
