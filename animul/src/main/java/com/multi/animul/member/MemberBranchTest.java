package com.multi.animul.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	MemberDAO dao;
	
	public void insert(MemberVO vo) {
		dao.insert(vo);
	}
	
	public void delete(MemberVO vo) {
		dao.delete(vo);
	}
	
	public int count() {
		return dao.count();
	}
	
	public List<MemberVO> all() {
		return dao.all();
	}
}
