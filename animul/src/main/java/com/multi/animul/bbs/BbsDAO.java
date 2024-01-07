package com.multi.animul.bbs;

import java.util.List;
import java.util.Map;

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
	

	public int update(BbsVO vo) {
		return my.update("bbs.update", vo);
		
	}

	public void delete(int bbs_id) {
		my.delete("bbs.delete", bbs_id);
	
	}
	
	public List<BbsVO> list() {
		List<BbsVO> list = my.selectList("bbs.list");
		return list;
	}
	
	public List<BbsVO> list2() {
		List<BbsVO> list = my.selectList("bbs.list2");
		return list;
	}
	
	public BbsVO one(int bbs_id) {
		return my.selectOne("bbs.one", bbs_id);
	}
	
	public void hit(int bbs_id) {
		my.update("bbs.updateHit",bbs_id);
	}
	
	public List<BbsVO> pagingList(Map<String, Integer> pagingParams) {
		return my.selectList("bbs.pagingList", pagingParams);
	}

	public List<BbsVO> pagingList2(Map<String, Integer> pagingParams) {
		return my.selectList("bbs.pagingList2", pagingParams);
	}

	public int bbsCount() {
		return my.selectOne("bbs.bbsCount");
	}
	
	public int bbsCount2() {
		return my.selectOne("bbs.bbsCount2");
	}
	
}

