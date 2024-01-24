package com.multi.animul.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypetService {
	@Autowired
	MypetDAO dao;
	
	public int insert(MypetVO vo) {
		return dao.insert(vo);
	}
	
	public int update(MypetVO vo) {
		return dao.update(vo);
	}
	
	public int count() {
		return dao.count();
	}
	
	public List<MypetVO> all() {
		return dao.all();
	}

	public List<MypetVO> simple_inquiry(MypetVO vo) {
		return dao.simple_inquiry(vo);
	}

	public MypetVO inquiry(MypetVO vo) {
		return dao.inquiry(vo);
	}
}
