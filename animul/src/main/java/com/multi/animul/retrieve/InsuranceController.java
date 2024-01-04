package com.multi.animul.retrieve;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InsuranceController {
	@Autowired
	InsuranceDAO dao;

	@RequestMapping("insurance_insert")
	public void insert(InsuranceVO vo, Model model) {
		int result = dao.insert(vo);
		model.addAttribute("result", result);
	}
}
