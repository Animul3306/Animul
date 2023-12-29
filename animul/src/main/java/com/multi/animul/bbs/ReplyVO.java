package com.multi.animul.bbs;

public class ReplyVO {
	private int reply_id;
	private int bbs_id;
	private String member_id;
	private String reply_content;
	private String reply_date;
	
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public int getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [reply_id=" + reply_id + ", bbs_id=" + bbs_id + ", member_id=" + member_id + ", reply_content="
				+ reply_content + ", reply_date=" + reply_date + "]";
	}
	
	
	
}
