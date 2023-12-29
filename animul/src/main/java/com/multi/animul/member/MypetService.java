package com.multi.animul.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypetService {
	@Autowired
	MypetDAO dao;
	
	public void insert(MypetVO vo) {
		dao.insert(vo);
	}
	
	public void delete(MypetVO vo) {
		dao.delete(vo);
	}
	
	public int count() {
		return dao.count();
	}
	
	public List<MypetVO> all() {
		return dao.all();
	}
}
