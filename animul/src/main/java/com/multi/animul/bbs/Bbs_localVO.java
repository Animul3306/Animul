package com.multi.animul.bbs;

public class Bbs_localVO {
	private int bbs_local_id;
	private String member_id;
	private String bbs_local_title;
	private String bbs_local_content;
	private String bbs_local_file;
	private String bbs_local_date;
	private int bbs_local_hit;
	private String bbs_local_loc;
	private String bbs_local_cate;
	
	
	public int getBbs_local_id() {
		return bbs_local_id;
	}
	public void setBbs_local_id(int bbs_local_id) {
		this.bbs_local_id = bbs_local_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBbs_local_title() {
		return bbs_local_title;
	}
	public void setBbs_local_title(String bbs_local_title) {
		this.bbs_local_title = bbs_local_title;
	}
	public String getBbs_local_content() {
		return bbs_local_content;
	}
	public void setBbs_local_content(String bbs_local_content) {
		this.bbs_local_content = bbs_local_content;
	}
	public String getBbs_local_file() {
		return bbs_local_file;
	}
	public void setBbs_local_file(String bbs_local_file) {
		this.bbs_local_file = bbs_local_file;
	}
	public String getBbs_local_date() {
		return bbs_local_date;
	}
	public void setBbs_local_date(String bbs_local_date) {
		this.bbs_local_date = bbs_local_date;
	}
	public int getBbs_local_hit() {
		return bbs_local_hit;
	}
	public void setBbs_local_hit(int bbs_local_hit) {
		this.bbs_local_hit = bbs_local_hit;
	}
	public String getBbs_local_location() {
		return bbs_local_location;
	}
	public void setBbs_local_location(String bbs_local_location) {
		this.bbs_local_location = bbs_local_location;
	}
	public String getBbs_local_cate() {
		return bbs_local_cate;
	}
	public void setBbs_local_cate(String bbs_local_cate) {
		this.bbs_local_cate = bbs_local_cate;
	}
	
	
	@Override
	public String toString() {
		return "LocalVO [bbs_local_id=" + bbs_local_id + ", member_id=" + member_id + ", bbs_local_title="
				+ bbs_local_title + ", bbs_local_content=" + bbs_local_content + ", bbs_local_file=" + bbs_local_file
				+ ", bbs_local_date=" + bbs_local_date + ", bbs_local_hit=" + bbs_local_hit + ", bbs_local_location="
				+ bbs_local_location + ", bbs_local_cate=" + bbs_local_cate + "]";
	}
	
	
	
}
