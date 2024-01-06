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

	public int login(MemberVO vo) {
		return my.selectOne("member.login", vo);
	}

	public MemberVO one(MemberVO vo) {
		return my.selectOne("member.one", vo);
	}
	
	public String findId(MemberVO vo) {
		return my.selectOne("member.findId", vo);
	}

	public Boolean findPwd(MemberVO vo) {
		return my.selectOne("member.findPwd", vo);
	}

	public int resetPwd(MemberVO vo) {
		return my.update("member.resetPwd", vo);
	}

	public boolean selectId(MemberVO vo) {
		return my.selectOne("member.selectId", vo);
	}

	public boolean selectEmail(MemberVO vo) {
		return my.selectOne("member.selectEmail", vo);
	}

	public boolean selectNickname(MemberVO vo) {
		return my.selectOne("member.selectNickname", vo);
	}

	public int join(MemberVO vo) {
		return my.insert("member.insert", vo);
	}
}
