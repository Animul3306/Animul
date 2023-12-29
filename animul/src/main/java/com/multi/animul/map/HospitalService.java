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
	
	public List<HospitalVO> list(HospitalVO vo)	{
		
		List<HospitalVO> list1 = new ArrayList<>(); //dao.list(vo);
		
		return list1;
		
	}
	
	public HospitalVO one(HospitalVO vo) {
		
		HospitalVO one1 = new HospitalVO(); //dao.one(vo);
		
		return one1;
	}
	
	public int count() {
		return dao.count();
	}
}
