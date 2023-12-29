package com.multi.animul.bbs;

public class BbsVO {
	private int bbs_id;
	private String member_id;
	private String bbs_title;
	private String bbs_content;
	private String bbs_file;
	private String bbs_date;
	private int bbs_hit;
	private String cate;
	
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
	public String getBbs_title() {
		return bbs_title;
	}
	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}
	public String getBbs_content() {
		return bbs_content;
	}
	public void setBbs_content(String bbs_content) {
		this.bbs_content = bbs_content;
	}
	public String getBbs_file() {
		return bbs_file;
	}
	public void setBbs_file(String bbs_file) {
		this.bbs_file = bbs_file;
	}
	public String getBbs_date() {
		return bbs_date;
	}
	public void setBbs_date(String bbs_date) {
		this.bbs_date = bbs_date;
	}
	public int getBbs_hit() {
		return bbs_hit;
	}
	public void setBbs_hit(int bbs_hit) {
		this.bbs_hit = bbs_hit;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	
	@Override
	public String toString() {
		return "BbsVO [bbs_id=" + bbs_id + ", member_id=" + member_id + ", bbs_title=" + bbs_title + ", bbs_content="
				+ bbs_content + ", bbs_file=" + bbs_file + ", bbs_date=" + bbs_date + ", bbs_hit=" + bbs_hit + ", cate="
				+ cate + "]";
	}
	
}
