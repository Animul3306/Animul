package com.multi.animul.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AskService {

	@Autowired
	AskDAO dao;
	
	public int insert(AskVO vo) {
		return dao.insert(vo);
	}
	
	public List<AskVO> list() {
		return dao.list();
	}
	
	public List<AskVO> list2(PageVO pageVO){
		return dao.list2(pageVO);
	}
	
	public int count() {
		return dao.count();
	}

	public AskVO one(AskVO vo) {
		return dao.one(vo);
	}
	
	public int update(AskVO vo) {
		return dao.update(vo);
	}
	
	public int delete(AskVO vo) {
		return dao.delete(vo);
	}
	
	public int updat2(AskVO vo2) {
		return dao.update2(vo2);
	}
	
}
