package com.multi.animul.retrieve;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RetrieveController {
	@Autowired
	RetrieveDAO dao;
	
	@RequestMapping("retrieveInsert")
	public void insert(RetrieveVO vo) {
		// TODO Auto-generated method stub

	}
}