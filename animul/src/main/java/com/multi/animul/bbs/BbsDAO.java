package com.multi.animul.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BbsDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(BbsVO vo) {
		int result = my.insert("bbs.insert", vo);
		return result;
	}
	
	public int update(BbsVO vo) {
		int result = my.update("bbs.update", vo);
		return result;

	}

	public int delete(BbsVO vo) {
		int result = my.delete("bbs.delete", vo);
		return result;

	}
	
	public List<BbsVO> list() {
		List<BbsVO> list = my.selectList("bbs.list");
		return list;
	}
	
	public BbsVO one(BbsVO vo) {
		BbsVO vo2 = my.selectOne("bbs.one",vo);
		return vo2;
	}
	
}

