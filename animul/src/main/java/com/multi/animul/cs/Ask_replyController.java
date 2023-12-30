package com.multi.animul.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Ask_replyController {

	@Autowired
	Ask_replyDAO dao;
	
	@RequestMapping("ask_reply_insert")
	public void insert(Ask_replyVO vo, Model model) {
		int result = dao.insert(vo);
		model.addAttribute("result", result);
	}
	
	
	
}
