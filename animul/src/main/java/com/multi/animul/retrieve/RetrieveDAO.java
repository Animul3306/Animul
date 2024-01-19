package com.multi.animul.retrieve;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RetrieveDAO {
	@Autowired
	SqlSessionTemplate my;

	public int insert(RetrieveVO vo) {
		int result = my.insert("retrieve.insert", vo);
		return result;
	}

	public int update(RetrieveVO vo) {
		int result = my.update("retrieve.update", vo);
		return result;
	}

	public List<RetrieveVO> list() {
		List<RetrieveVO> list = my.selectList("retrieve.list");
		return list;
	}

	public int delete(RetrieveVO vo) {
		int result = my.delete("retrieve.delete", vo);
		return result;
	}
	
	//1.service method -> dao.selectList() 
	//2,, controller 
	public List<SymptomVO> selectList() {
		List<SymptomVO> list = my.selectList("retrieve.list1");
		return list;
	}

}
