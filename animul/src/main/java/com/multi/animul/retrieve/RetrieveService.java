package com.multi.animul.retrieve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RetrieveService {
	@Autowired
	RetrieveDAO dao;
	
	public List<RetrieveVO> list(int symptom_id) {
		return dao.list(symptom_id);
	}

	//serivce.selectList(symptom_id);
	public List<SymptomVO> selectList() {
		return dao.selectList();
	}
	
	
	//부위별 증상가져오기 ex) 눈이상 
	public List<SymptomVO> selectRegionList(int region_id) {
		List<SymptomVO> list = dao.selectRegionList(region_id);
		return list;
	}
	

	
}
