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

	//views/insurance.jsp
	//views/retrieve/insurance.jsp
	@RequestMapping("retrieve/retrieve2")
	public String retrieve(Model model){
		//controller -> dao -> mapper.xml -> mysql
		//controller -> service -> dao -> mapper.xml -> mysql
		
		List<SymptomVO> list = serivce.selectList();

		
		model.addAttribute("list", list);
		return "retrieve/retrieve2"; //---> retrieve2.jsp
	}

	@RequestMapping("retrieve/retrieve_list")
	public String retrieve_list( Model model){
		//controller -> dao -> mapper.xml -> mysql
		//controller -> service -> dao -> mapper.xml -> mysql
		
		List<RetrieveVO> list = serivce.list();

		
		model.addAttribute("list", list);
		return "retrieve/retrieve2"; //insurance.jsp ȣ��
	 }
		/*
		 * @RequestMapping("retrieve/retrieve_select") public String
		 * retrieve_select(String symptom_text, Model model){
		 * 
		 * 
		 * System.out.println(symptom_text); List<RetrieveVO> list =
		 * serivce.list(symptom_text);
		 * 
		 * 
		 * model.addAttribute("list", list); return "retrieve/insurance";
		 * //insurance.jsp ȣ�� }
		 */
	
	

}