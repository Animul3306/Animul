package com.multi.animul.map;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class HospitalService {

	@Autowired
	HospitalDAO dao;
	
	public void kakaoMap() {
		/*
		 *  map 호출
		 *  map 리스트 multiple marker 출력 이미지,
		 *  map single marker 출력 이미지.
		 */
	}
	/*
	public List<HospitalVO> list(HospitalVO vo)	{
		
		List<HospitalVO> list1 = dao.list(vo);
		
		return list1;
		
	}
	*/
	public HospitalVO one(HospitalVO vo) {
		
		HospitalVO one1 = new HospitalVO(); //dao.one(vo);
		
		return one1;
	}
	
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
