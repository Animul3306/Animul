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

	public List<HospitalVO> list2(PageVO pageVO) {
		return my.selectList("hospital.list2",pageVO); //("namepace.id", vo)		
	}
	
	public List<HospitalVO> list3(PageVO pageVO) {
		return my.selectList("hospital.list3",pageVO);
		
	}
	
	public int count(PageVO vo) {		
		return my.selectOne("hospital.count", vo);
	}
	
	public int countAddress(PageVO vo) {		
		return my.selectOne("hospital.countAddress", vo);
	}
	
	public int countKeyword(PageVO vo) {		
		return my.selectOne("hospital.countKeyword", vo);
	}
	
	public HospitalVO one(HospitalVO vo) {
		HospitalVO hospitalVO = my.selectOne("hospital.one",vo);
		
		return hospitalVO;
	}
}
