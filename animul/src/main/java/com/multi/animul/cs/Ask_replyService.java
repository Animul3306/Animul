package com.multi.animul.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Ask_replyService {

	@Autowired
	Ask_replyDAO dao;
	
	public int insert(Ask_replyVO vo) {
		return dao.insert(vo);	
	}
	
	public List<Ask_replyVO> list(int ask_id) {
		return dao.list(ask_id);
	}
	
	public int delete(Ask_replyVO vo) {
		return dao.delete(vo);
	}
	
	public Ask_replyVO one(Ask_replyVO vo) {
		return dao.one(vo);
	}
	
	public int update(Ask_replyVO vo) {
		return dao.update(vo);
		
	}
	
	
	
}
