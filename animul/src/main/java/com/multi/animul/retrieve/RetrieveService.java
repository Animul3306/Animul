package com.multi.animul.retrieve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RetrieveService {
	@Autowired
	RetrieveDAO dao;
	
	public List<RetrieveVO> list() {
		return dao.list();
	}

	public List<SymptomVO> selectList() {
		return dao.selectList();
	}
	

	
}
