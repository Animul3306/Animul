package com.multi.animul.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class DiagnosisController {

	@Autowired
	DiagnosisService diagnosisService;
	
	@RequestMapping("diagnosis/diagnosisInsert")
	public void insert(DiagnosisVO diagnosisVO, Model model) {
		int diagnosisResult = diagnosisService.insert(diagnosisVO);
		
		model.addAttribute("diagnosisResult", diagnosisResult);
	}
	
	@RequestMapping("diagnosis/diagnosisOne")
	public void one(DiagnosisVO diagnosisVO, Model model) {
		DiagnosisVO diagnosisBag = diagnosisService.one(diagnosisVO);
		model.addAttribute("diagnosisBag", diagnosisBag);
	}
	
	@RequestMapping("diagnosis/diagnosisList")
	public void list(Model model) {
		List<DiagnosisVO> diagnosisList = diagnosisService.list();
		model.addAttribute("diagnosisList", diagnosisList);
	}
}
