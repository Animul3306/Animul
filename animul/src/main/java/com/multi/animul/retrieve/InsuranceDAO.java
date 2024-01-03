package com.multi.animul.retrieve;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InsuranceDAO {
	@Autowired
	SqlSessionTemplate my;

	public int insert(InsuranceVO vo) {
		int result = my.insert("insurance.insert", vo);
		return result;
	}

	public int update(InsuranceVO vo) {
		int result = my.update("insurance.update", vo);
		return result;
	}

	public List<InsuranceVO> list() {
		List<InsuranceVO> list = my.selectList("insurance.list");
		return list;
	}

	public int delete(InsuranceVO vo) {
		int result = my.delete("insurance.delete", vo);
		return result;
	}
}
