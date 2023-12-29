package com.multi.animul.map;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HospitalDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public List<HospitalVO> list1(PageVO pageVO) {
		return my.selectList("hospital.list1",pageVO);
	}
	
	public HospitalVO one(HospitalVO vo) {
		HospitalVO hospitalVO = my.selectOne("hospital.one",vo);
		
		return hospitalVO;
	}
	
	public int count() {
		
		return my.selectOne("hospital.count");
	}
	
}
