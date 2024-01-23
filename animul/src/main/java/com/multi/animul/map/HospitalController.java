package com.multi.animul.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/map")
public class HospitalController {
	
	@Autowired
	HospitalService service;
 
	@RequestMapping(value="/list1") 
	public void list1(PageVO pageVO, Model model) { //start , end
 	
		pageVO.setStartEnd();
		
		List<HospitalVO> list = service.list1(pageVO);
		System.out.println(list.size());
		System.out.println(list.toString());
						
		//model로 views까지 페이지수를 넘겨야 페이지수 버튼을 만들수 있음.
		int count = service.count(pageVO); //전체 게시물 수
 
		int pages = count / 10;
		if(count%10 != 0) {
			pages = count / 10 + 1;
		}
		
		pageVO.calculation(count);
//		System.out.println(pageVO.toString());
		
		//views의 list1.jsp로 전달
		model.addAttribute("list1", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
		model.addAttribute("page", pageVO);
	}
 
	@RequestMapping(value="/list2")
	public void list2(String centerType, String centerAddr1, PageVO pageVO, Model model) {		
 	//	System.out.println("Controller centerType : " + centerType + " , centerAddr1" + centerAddr1);
		pageVO.setCurrentAddress(centerAddr1);
		pageVO.setCenterType(centerType);
		pageVO.setStartEnd();
		
		List<HospitalVO> list = service.list2(pageVO);
 		System.out.println(list.toString());
 		System.out.println(pageVO.getCenterType());
		
		int count = service.countAddress(pageVO);
		int pages = count / 10;
		if(count%10 != 0) {
			pages = count / 10 + 1;
		}
		System.out.println("pages :" + pages);
		pageVO.calculation(count);
 
		model.addAttribute("list2", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
		model.addAttribute("page", pageVO);
		model.addAttribute("addr", centerAddr1);
		model.addAttribute("centerType1", centerType);
		
	}

	@RequestMapping(value="/list3")	
	public void list3(String centerType2, String keywordSearch1, PageVO pageVO, Model model) {		
	 	System.out.println("Controller centerType2 : " + centerType2 + " , centerAddr1" + keywordSearch1);
		pageVO.setKeywordSearch(keywordSearch1);
		pageVO.setCenterType(centerType2);
		pageVO.setStartEnd();
		
		List<HospitalVO> list = service.list3(pageVO);
		System.out.println(list.toString());
 		
		int count = service.countKeyword(pageVO);
		int pages = count / 10;
		if(count%10 != 0) {
			pages = count / 10 + 1;
		}

		pageVO.calculation(count);
				
		model.addAttribute("list3", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
		model.addAttribute("page", pageVO);
		model.addAttribute("keywd", keywordSearch1);
		model.addAttribute("centerType21", centerType2);
 	 
	} 

}
