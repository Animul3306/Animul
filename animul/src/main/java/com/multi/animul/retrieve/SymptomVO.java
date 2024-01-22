package com.multi.animul.retrieve;

public class SymptomVO {
	private int symptom_id;
	private String symptom_text;
	private int region_id;
	private String region_text;
	public int getSymptom_id() {
		return symptom_id;
	}
	public void setSymptom_id(int symptom_id) {
		this.symptom_id = symptom_id;
	}
	public String getSymptom_text() {
		return symptom_text;
	}
	public void setSymptom_text(String symptom_text) {
		this.symptom_text = symptom_text;
	}
	public int getRegion_id() {
		return region_id;
	}
	public void setRegion_id(int region_id) {
		this.region_id = region_id;
	}
	public String getRegion_text() {
		return region_text;
	}
	public void setRegion_text(String region_text) {
		this.region_text = region_text;
	}
	@Override
	public String toString() {
		return "SymptomVO [symptom_id=" + symptom_id + ", symptom_text=" + symptom_text + ", region_id=" + region_id
				+ ", region_text=" + region_text + "]";
	}
	
}
