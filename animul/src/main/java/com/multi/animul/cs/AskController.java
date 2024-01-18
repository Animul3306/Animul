package com.multi.animul.cs;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;



@Controller
public class AskController {

	@Autowired
	AskService service;
	
	@Autowired
	Ask_replyService service2;
	
	
	@RequestMapping("cs/ask_insert")
	public void insert(AskVO vo, Model model) {
	int result = service.insert(vo);
	model.addAttribute("result", result);
	}
	
	
	@RequestMapping("cs/ask_delete")
	public void delete(AskVO vo) {
		int result = service.delete(vo);
		
	}
	
	@RequestMapping("cs/ask_update")
	public void update(AskVO vo, Model model) {
	    AskVO vo2= service.one(vo);
		model.addAttribute("vo2", vo2);
		System.out.println("------------->" + vo2);
	}	
	
	@RequestMapping("cs/ask_update2")
	public String update2(AskVO vo) {
	 
		int result = service.update(vo);
		if (result ==1) {
			return "cs/ask_update2";
		}else {
		    return "cs/ask_list";}
	    }	
	
	
	
	
	@RequestMapping("cs/ask_list")
	public void list(Model model) {
	 List<AskVO> list = service.list();
	 model.addAttribute("list", list);
	}
	
	@RequestMapping("cs/ask_one")
	public void one(AskVO vo, Model model) {
	AskVO vo2 = service.one(vo);
	List<Ask_replyVO> list = service2.list(vo.getAsk_id());
	System.out.println(list);
	model.addAttribute("vo2", vo2);
	model.addAttribute("list", list);
	
	
	}
	
}
