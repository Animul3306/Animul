package com.multi.animul.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(MemberVO vo) {
		my.insert("member.insert", vo);
	}
	
	public List<MemberVO> all() {
		return my.selectList("fitness.all");
	}
	
	public int delete(MemberVO vo) {
		return my.delete("member.delete", vo);
	}
	
	public int count() {
		return my.selectOne("fitness.count");
	}
}
