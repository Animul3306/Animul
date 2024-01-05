package com.multi.animul.map;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/map")
public class HospitalController {
	
	@Autowired
	HospitalService service;
	
	/*
	@RequestMapping(value="/list")
	public List<HospitalVO> list(HospitalVO vo) {
		List<HospitalVO> list1 = new ArrayList<>(); // service.method_list(vo);		
		return list1;
	}
	*/

	@RequestMapping(value="/one")
	public HospitalVO one(HospitalVO vo) {
		
		/*
		 * service 함수 호출 -> dao 함수 호출 ->
		 * return 페이지 
		 */
		
		HospitalVO one1 = new HospitalVO(); //service.method_one(vo); 
		
		return one1;
	}
	
	@RequestMapping(value="/count")
	public void count(Model model) {

		int count = service.count();
		System.out.println("count: " + count);
	
		model.addAttribute("count", count);
	
	//	return "redirect:main";
	//	return "foward:main";
	}
		 
	@RequestMapping("list1")
	public void list1(PageVO pageVO, Model model) { //start , end
		pageVO.setStartEnd();
		
		List<HospitalVO> list=  service.list1(pageVO);
		System.out.println(list.size());
		System.out.println(list.toString());
						
		//model로 views까지 페이지수를 넘겨야 페이지수 버튼을 만들수 있음.
		int count = service.count(); //전체 게시물 수
		System.out.println("전체 게시물 수 >> " + count );
		int pages = count / 10;
		if(count%10 != 0) {
			pages = count / 10 + 1;
		}
		
		pageVO.calculation(count);
		  
	//	pageVO.setStartEnd();
		System.out.println(pageVO.toString());
		
		//views의 list1.jsp로 전달
		model.addAttribute("list1", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
		model.addAttribute("page", pageVO);
	}

}
