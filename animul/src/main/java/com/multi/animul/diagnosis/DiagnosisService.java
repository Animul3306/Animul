package com.multi.animul.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiagnosisService {

	@Autowired
	DiagnosisDAO diagnosisDAO;
	
	public int insert(DiagnosisVO diagnosisVO) {
		return diagnosisDAO.insert(diagnosisVO);
	}
	
	public DiagnosisVO one(DiagnosisVO diagnosisVO) {
		return diagnosisDAO.one(diagnosisVO);
	}
	
	public List<DiagnosisVO> list() {
		return diagnosisDAO.list();
	}
	
	public List<DiagnosisVO> find(DiagnosisVO diagnosisVO) {
		return diagnosisDAO.find(diagnosisVO);
	}
}
