package com.multi.animul.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	@Autowired 
	NoticeService service;
	
	@RequestMapping("cs/notice_insert")
	public void insert(NoticeVO vo, Model model) {
	int result	= service.insert(vo);
	model.addAttribute("result", result);
	}
	
}
