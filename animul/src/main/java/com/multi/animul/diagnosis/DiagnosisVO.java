package com.multi.animul.diagnosis;

public class DiagnosisVO {
	private String diagnosis_name;
	private String diagnosis_category;
	
	public String getDiagnosis_name() {
		return diagnosis_name;
	}
	public void setDiagnosis_name(String diagnosis_name) {
		this.diagnosis_name = diagnosis_name;
	}
	public String getDiagnosis_category() {
		return diagnosis_category;
	}
	public void setDiagnosis_category(String diagnosis_category) {
		this.diagnosis_category = diagnosis_category;
	}
	
	@Override
	public String toString() {
		return "DiagnosisVO [diagnosis_name=" + diagnosis_name + ", diagnosis_category=" + diagnosis_category + "]";
	}
}
