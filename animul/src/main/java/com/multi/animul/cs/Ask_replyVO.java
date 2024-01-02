package com.multi.animul.cs;

public class Ask_replyVO {

	private int ask_reply_id;
	private String member_id;
	private String ask_reply_title;
	private String ask_reply_content;
	private String ask_reply_date;
	private int ask_id;
	public int getAsk_reply_id() {
		return ask_reply_id;
	}
	public void setAsk_reply_id(int ask_reply_id) {
		this.ask_reply_id = ask_reply_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAsk_reply_title() {
		return ask_reply_title;
	}
	public void setAsk_reply_title(String ask_reply_title) {
		this.ask_reply_title = ask_reply_title;
	}
	public String getAsk_reply_content() {
		return ask_reply_content;
	}
	public void setAsk_reply_content(String ask_reply_content) {
		this.ask_reply_content = ask_reply_content;
	}
	public String getAsk_reply_date() {
		return ask_reply_date;
	}
	public void setAsk_reply_date(String ask_reply_date) {
		this.ask_reply_date = ask_reply_date;
	}
	public int getAsk_id() {
		return ask_id;
	}
	public void setAsk_id(int ask_id) {
		this.ask_id = ask_id;
	}
	
	@Override
	public String toString() {
		return "Ask_replyVO [ask_reply_id=" + ask_reply_id + ", member_id=" + member_id + ", ask_reply_title="
				+ ask_reply_title + ", ask_reply_content=" + ask_reply_content + ", ask_reply_date=" + ask_reply_date
				+ ", ask_id=" + ask_id + "]";
	}
	
	
	
	
	
	
}
