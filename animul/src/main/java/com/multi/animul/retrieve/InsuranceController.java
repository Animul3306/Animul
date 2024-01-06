package com.multi.animul.retrieve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InsuranceController {
	@Autowired
	InsuranceService serivce;

	//views/insurance.jsp
	//views/retrieve/insurance.jsp
	@RequestMapping("retrieve/insurance")
	public String insurance(){
		return "retrieve/insurance"; //---> insurance.jsp
	}

	@RequestMapping("retrieve/insurance_select")
	public String insurance_select(String insurance_company, Model model){
		//controller -> dao -> mapper.xml -> mysql
		//controller -> service -> dao -> mapper.xml -> mysql
		
		System.out.println(insurance_company);
		List<InsuranceVO> list = serivce.list(insurance_company);

		
		model.addAttribute("list", list);
		return "retrieve/insurance"; //insurance.jsp È£Ãâ
	 }
}