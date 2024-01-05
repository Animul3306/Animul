package com.multi.animul.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


@Repository
public class BbsDAO {

	@Autowired
	SqlSessionTemplate my;
	
	
	public int insert(BbsVO vo) {
		int result = my.insert("bbs.insert", vo);
		return result;
	}
	
	public void update(BbsVO vo) {
		my.update("bbs.update", vo);
		
	}

	public int delete(BbsVO vo) {
		int result = my.delete("bbs.delete", vo);
		return result;

	}
	
	public List<BbsVO> list() {
		List<BbsVO> list = my.selectList("bbs.list");
		return list;
	}
	
	
	public BbsVO one(int bbs_id) {
		return my.selectOne("bbs.one", bbs_id);
	}
	
	public void hit(int bbs_id) {
		my.update("bbs.updateHit",bbs_id);
	}
	
	
	
}

