package com.multi.animul.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyService {
	
	@Autowired
	ReplyDAO dao;
	
	public void save(ReplyVO replyVO) {
		dao.save(replyVO);
	  	
	}
	
	public List<ReplyVO> findAll(int bbs_id) {
		return dao.findAll(bbs_id);
	}

	public void delete(ReplyVO replyVO) {
		dao.delete(replyVO);
	}

	
}
		



