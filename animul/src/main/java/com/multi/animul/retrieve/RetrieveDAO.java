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

	//증상 병명가져오기
	public List<RetrieveVO> list(int symptom_id) {
		List<RetrieveVO> list = my.selectList("retrieve.list", symptom_id);
		return list;
	}

	public int delete(RetrieveVO vo) {
		int result = my.delete("retrieve.delete", vo);
		return result;
	}
	
	//1.service method -> dao.selectList() 
	//2,, controller 
	//부위별 증상가져오기
	public List<SymptomVO> selectList() {
		List<SymptomVO> list = my.selectList("retrieve.list1");
		return list;
	}

}
