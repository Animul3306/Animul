package com.multi.animul.retrieve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RetrieveController {
	@Autowired
	RetrieveService serivce;

	//<a href='retrieve2?symptom_id=4'>
	@RequestMapping("retrieve/retrieveDetail")
	public String retrieveDetail(int symptom_id, Model model){
		//controller -> dao -> mapper.xml -> mysql
		//controller -> service -> dao -> mapper.xml -> mysql
		
		List<RetrieveVO> list = serivce.list(symptom_id);

		
		model.addAttribute("list", list);
		
		System.out.println(list.size());
		return "retrieve/retrieveDetail"; //---> retrieve2.jsp
	}

	
	//<a href='retrieve2?symptom_id=4'>
	@RequestMapping("retrieve/retrieve2")
	public String retrieve( Model model){
		//controller -> dao -> mapper.xml -> mysql
		//controller -> service -> dao -> mapper.xml -> mysql
		
		List<SymptomVO> list = serivce.selectList();

		
		model.addAttribute("list", list);
		return "retrieve/retrieve2"; //---> retrieve2.jsp
	}
		 
	
	

}