package com.multi.animul.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AskController {

	@Autowired
	AskDAO dao;
	
	@Autowired
	Ask_replyDAO dao2;
	
	@RequestMapping("ask_insert")
	public void insert(AskVO vo, Model model) {
	int result = dao.insert(vo);
	model.addAttribute("result", result);
	}
	
	
	
	
	
	
	@RequestMapping("ask_list")
	public void list(Model model) {
	 List<AskVO> list = dao.list();
	 model.addAttribute("list", list);
	}
	
	@RequestMapping("ask_one")
	public void one(AskVO vo, Model model) {
	AskVO vo2 = dao.one(vo);
	
	
	model.addAttribute("vo2", vo2);
	
	
	}
	
}
