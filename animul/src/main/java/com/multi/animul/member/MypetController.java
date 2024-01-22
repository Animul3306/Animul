package com.multi.animul.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MypetController {
	@Autowired
	MypetService service;
	
	@PostMapping("mypetInsert")
	public void insert(MypetVO vo) {
		service.insert(vo);
	}
	
	@PostMapping("mypetDelete")
	public void delete(MypetVO vo) {
		service.delete(vo);
	}
	
	@PostMapping("mypetCount")
	public int count() {
		return service.count();
	}
	
	@PostMapping("mypetAll")
	public List<MypetVO> all() {
		return service.all();
	}
}
