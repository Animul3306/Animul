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
	Ask_replyService replyservice;
	
	
	@RequestMapping("cs/ask_insert")
	public void insert(AskVO vo,
					   HttpServletRequest request,
					   MultipartFile file,
			           Model model) throws Exception {
	
		
	
	
	
	service.insert(vo);
    String savedName = file.getOriginalFilename();
	String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
	File target = new File(uploadPath + "/" + savedName);
	file.transferTo(target);
	model.addAttribute("savedName", savedName);
	System.out.println("이미지 넣기 전" + vo );
	vo.setAsk_img(savedName);
	System.out.println("이미지 넣은 후" + vo );
	service.insert(vo);
	
	
	
	
	
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
	public void update2(AskVO vo) {
	 
		int result = service.update(vo);
		
	    }	
	
	
	
	
	@RequestMapping("cs/ask_list")
	public void list(Model model) {
	 List<AskVO> list = service.list();
	 model.addAttribute("list", list);
	}
	
	@RequestMapping("cs/ask_list1")
	public void list1(Model model) {
	 List<AskVO> list = service.list1();
	 model.addAttribute("list", list);
	}
	
	@RequestMapping("cs/ask_list2")
	public void list2(PageVO pageVO, Model model) {
		pageVO.setStartEnd();
     List<AskVO> list = service.list2(pageVO);
			int count = service.count();
			int pages = count/10;
			if(count % 10 !=0) {
				pages =count/ 10 +1;
			}
			
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
		
	}
	
	
	@RequestMapping("cs/ask_one")
	public void one(AskVO vo, Model model) {
	AskVO vo2 = service.one(vo);
	List<Ask_replyVO> list = replyservice.list(vo.getAsk_id());
	System.out.println(list);
	model.addAttribute("vo2", vo2);
	model.addAttribute("list", list);
	
	
	}
	
}
