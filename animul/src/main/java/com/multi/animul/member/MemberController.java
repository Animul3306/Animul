package com.multi.animul.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	
	@RequestMapping("memberInsert")
	public void insert(MemberVO vo) {
		service.insert(vo);
	}
	
	@RequestMapping("memberDelete")
	public void delete(MemberVO vo) {
		service.delete(vo);
	}
	
	@RequestMapping("memberCount")
	public int count() {
		return service.count();
	}
	
	@RequestMapping("memberAll")
	public List<MemberVO> all() {
		return service.all();
	}
}
