package com.multi.animul.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypetController {
	@Autowired
	MypetService service;
	
	@RequestMapping("mypetInsert")
	public void insert(MypetVO vo) {
		service.insert(vo);
	}
	
	@RequestMapping("mypetDelete")
	public void delete(MypetVO vo) {
		service.delete(vo);
	}
	
	@RequestMapping("mypetCount")
	public int count() {
		return service.count();
	}
	
	@RequestMapping("mypetAll")
	public List<MypetVO> all() {
		return service.all();
	}
}
