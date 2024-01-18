package com.multi.animul.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Ask_replyController {

	@Autowired
	Ask_replyService replyservice;
	
	@Autowired
	AskService service;
	
	
	
	@RequestMapping("cs/ask_reply_insert")
	public void insert(Ask_replyVO vo, Model model) {
		System.out.println(vo);//(Ask_replyVO
		int result = replyservice.insert(vo);
		
		//ask update ask_status 
		
		AskVO vo2 = new AskVO();
		vo2.setAsk_id(vo.getAsk_id());
		vo2.setAsk_status("답변완료");
		service.updat2(vo2);// (AskVO ask_id ask_status
		
		model.addAttribute("result", result);
	}
	
	@RequestMapping("cs/ask_reply_delete")
	public void delete(Ask_replyVO vo) {
		int result = replyservice.delete(vo);
	}
	
	@RequestMapping("cs/ask_reply_one")
	public void one(Ask_replyVO vo, Model model) {
	   Ask_replyVO vo3 =replyservice.one(vo);
	   model.addAttribute("vo3", vo3);
	   
	}
	
	@RequestMapping("cs/ask_reply_update")
	public void update(Ask_replyVO vo, Model model) {
	   Ask_replyVO vo3 = replyservice.one(vo);
	   model.addAttribute("vo3", vo3);
	}
	
	@RequestMapping("cs/ask_reply_update2")
	public String update2(Ask_replyVO vo) {
		
		int result = replyservice.update(vo);
		if (result==1) {
			return "cs/ask_reply_update2";
		}else
		    return "cs/ask_list";
	    }
	
	
	
}
