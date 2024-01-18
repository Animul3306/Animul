package com.multi.animul.cs;

public class AskVO {

	private int ask_id;
	private String member_id;
	private String ask_title;
	private String ask_content;
	private String ask_date;
	private String ask_file;
	private String ask_category;
	private String ask_status;
	
	public int getAsk_id() {
		return ask_id;
	}
	public void setAsk_id(int ask_id) {
		this.ask_id = ask_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAsk_title() {
		return ask_title;
	}
	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}
	public String getAsk_content() {
		return ask_content;
	}
	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}
	public String getAsk_date() {
		return ask_date;
	}
	public void setAsk_date(String ask_date) {
		this.ask_date = ask_date;
	}
	public String getAsk_file() {
		return ask_file;
	}
	public void setAsk_file(String ask_file) {
		this.ask_file = ask_file;
	}
	public String getAsk_category() {
		return ask_category;
	}
	public void setAsk_category(String ask_category) {
		this.ask_category = ask_category;
	}
	public String getAsk_status() {
		return ask_status;
	}
	public void setAsk_status(String ask_status) {
		this.ask_status = ask_status;
	}
	
	@Override
	public String toString() {
		return "AskVO [ask_id=" + ask_id + ", member_id=" + member_id + ", ask_title=" + ask_title + ", ask_content="
				+ ask_content + ", ask_date=" + ask_date + ", ask_file=" + ask_file + ", ask_category=" + ask_category
				+ ", ask_status=" + ask_status + "]";
	}
	
    
	
}
