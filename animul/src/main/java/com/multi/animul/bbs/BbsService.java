package com.multi.animul.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BbsService {

	@Autowired
	BbsDAO dao;
	
	public int insert(BbsVO vo) {
		return dao.insert(vo);
	}
	
	public List<BbsVO> list() {
		return dao.list();
	}
		
	public BbsVO one(int bbs_id) {
		return dao.one(bbs_id);
	}

	public void hit(int bbs_id) {
		dao.hit(bbs_id);
		
	}

	public int update(BbsVO vo) {
		return dao.update(vo);
	}

	public void delete(int bbs_id) {
		dao.delete(bbs_id);
		
	}

	public List<BbsVO> list2() {
		return dao.list2();
	}

	
}
