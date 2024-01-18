package com.multi.animul.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	@Autowired 
	NoticeService service;
	
	@RequestMapping("cs/notice_insert")
	public void insert(NoticeVO vo) {
	int result =service.insert(vo);
	
	}
	
	@RequestMapping("cs/notice_delete")
	public void delete(NoticeVO vo) {
	service.delete(vo);
	}
	
	@RequestMapping("cs/notice_update")
	public void update(NoticeVO vo, Model model) {
		NoticeVO vo2 = service.one(vo);
		model.addAttribute("vo2", vo2);
	}
	
	@RequestMapping("cs/notice_update2")
	public void update2(NoticeVO vo) {
		
		int result = service.update(vo);
	}
	
	@RequestMapping("cs/notice_list")
	public void list(Model model) {
		List<NoticeVO> list=service.list();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("cs/notice_list2")
	public void list2(PageVO pageVO, Model model) {
		pageVO.setStartEnd();
		    List<NoticeVO> list = service.list2(pageVO);
		    int count = service.count();
		    int pages = count/10;
		    if(count % 10 !=0) {
		    pages = count /10 + 1;
		    }
		    model.addAttribute("list", list);
		    model.addAttribute("pages", pages);
		    model.addAttribute("count", count);
	}
	
	
	@RequestMapping("cs/notice_one")
	public void one(NoticeVO vo, Model model) {
	
		NoticeVO vo2 = service.one(vo);
		model.addAttribute("vo2", vo2);
	}
}
