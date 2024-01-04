package com.multi.animul.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class Bbs_localDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(Bbs_localVO vo) {
		int result = my.insert("bbs.insert", vo);
		return result;
	}
	
	public int update(Bbs_localVO vo) {
		int result = my.update("bbs.update", vo);
		return result;

	}

	public int delete(Bbs_localVO vo) {
		int result = my.delete("bbs.delete", vo);
		return result;

	}
	
	public List<Bbs_localVO> list() {
		List<Bbs_localVO> list = my.selectList("bbs.list");
		return list;
	}
	
	public Bbs_localVO one(Bbs_localVO vo) {
		Bbs_localVO vo2 = my.selectOne("bbs.one",vo);
		return vo2;
	}
	
}

