package com.multi.animul.map;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/map")
public class HospitalController {
	
	@Autowired
	HospitalService service;
 
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
/*
		int count = service.count();
		System.out.println("count: " + count);
	
		model.addAttribute("count", count);
*/	
	//	return "redirect:main";
	//	return "foward:main";
	}
 	 
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
	public void list2(String centerAddr1, PageVO pageVO, Model model) {		
//		System.out.println("Controller centerAddr : " + centerAddr1);
		pageVO.setCurrentAddress(centerAddr1);		
		pageVO.setStartEnd();
		
		List<HospitalVO> list = service.list2(pageVO);
//		System.out.println(list.toString());
		
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
		
//		return "redirect:list2.jsp";
	}

	@RequestMapping(value="/list3")	
	public void list3(String keywordSearch1, PageVO pageVO, Model model) {		
		pageVO.setKeywordSearch(keywordSearch1);		
		pageVO.setStartEnd();
		
		List<HospitalVO> list = service.list3(pageVO);
 //		System.out.println(list.toString());
 		
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

	//	return "redirect:SearchMain.jsp?list=list3?keyword=keywordSearch1";
	} 
}
