package com.multi.animul.retrieve;

public class RetrieveVO {
	private int symptom_id;
	private String result;
	private String result_text;
	private String img;
	private int result_id;
	public int getSymptom_id() {
		return symptom_id;
	}
	public void setSymptom_id(int symptom_id) {
		this.symptom_id = symptom_id;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getResult_text() {
		return result_text;
	}
	public void setResult_text(String result_text) {
		this.result_text = result_text;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getResult_id() {
		return result_id;
	}
	public void setResult_id(int result_id) {
		this.result_id = result_id;
	}
	@Override
	public String toString() {
		return "RetrieveVO [symptom_id=" + symptom_id + ", result=" + result + ", result_text=" + result_text + ", img="
				+ img + ", result_id=" + result_id + "]";
	}
	
	
}
