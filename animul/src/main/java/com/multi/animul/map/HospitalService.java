package com.multi.animul.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class HospitalService {

	@Autowired
	HospitalDAO dao;
 
	public int count(PageVO vo) {
		return dao.count(vo);
	}

	public int countAddress(PageVO vo) {
		return dao.countAddress(vo);
	}

	public int countKeyword(PageVO vo) {
		return dao.countKeyword(vo);
	}
	
	public List<HospitalVO> list1(PageVO vo) {
		List<HospitalVO> list1 = dao.list1(vo);
		return list1;
	}
	
	public List<HospitalVO> list2(PageVO vo) {
		List<HospitalVO> list2 = dao.list2(vo);
		return list2;
	}
	
	public List<HospitalVO> list3(PageVO vo) {
		List<HospitalVO> list3 = dao.list3(vo);
		return list3;
	}
}
