package com.multi.animul.retrieve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InsuranceService {
	@Autowired
	InsuranceDAO dao;

	public List<InsuranceVO> list(String company){
		return dao.list(company);
	}
}
