package com.multi.animul.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AskController {

	@Autowired
	AskDAO dao;
	
	@RequestMapping("ask_insert")
	public void insert(AskVO vo, Model model) {
	int result = dao.insert(vo);
	model.addAttribute("result", result);
	}
	
}
