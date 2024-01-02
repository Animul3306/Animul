package com.multi.animul.cs;

public class FaqVO {

	private int faq_id;
	private String faq_title;
	private String faq_content;
	private String faq_category;
	public int getFaq_id() {
		return faq_id;
	}
	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}
	
	@Override
	public String toString() {
		return "FaqVO [faq_id=" + faq_id + ", faq_title=" + faq_title + ", faq_content=" + faq_content
				+ ", faq_category=" + faq_category + "]";
	}
	
	
	
}
