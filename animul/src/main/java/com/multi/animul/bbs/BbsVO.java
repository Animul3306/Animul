package com.multi.animul.bbs;

public class BbsVO {
	private int bbs_id;
	private String member_id;
	private String bbs_title;
	private String bbs_content;
	private String bbs_img;
	private String bbs_thumbImg;
	private String bbs_date;
	private int bbs_hit;
	private String bbs_cate;
	private int bbs_menu;
	private int bbs_loc;
	
	
	public String getBbs_img() {
		return bbs_img;
	}
	public void setBbs_img(String bbs_img) {
		this.bbs_img = bbs_img;
	}
	public String getBbs_thumbImg() {
		return bbs_thumbImg;
	}
	public void setBbs_thumbImg(String bbs_thumbImg) {
		this.bbs_thumbImg = bbs_thumbImg;
	}
	public int getBbs_loc() {
		return bbs_loc;
	}
	public void setBbs_loc(int bbs_loc) {
		this.bbs_loc = bbs_loc;
	}
	public int getBbs_menu() {
		return bbs_menu;
	}
	public void setBbs_menu(int bbs_menu) {
		this.bbs_menu = bbs_menu;
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
	public String getBbs_cate() {
		return bbs_cate;
	}
	public void setBbs_cate(String bbs_cate) {
		this.bbs_cate = bbs_cate;
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
	@Override
	public String toString() {
		return "BbsVO [bbs_id=" + bbs_id + ", member_id=" + member_id + ", bbs_title=" + bbs_title + ", bbs_content="
				+ bbs_content + ", bbs_img=" + bbs_img + ", bbs_thumbImg=" + bbs_thumbImg + ", bbs_date=" + bbs_date
				+ ", bbs_hit=" + bbs_hit + ", bbs_cate=" + bbs_cate + ", bbs_menu=" + bbs_menu + ", bbs_loc=" + bbs_loc
				+ "]";
	}
	
	



	
}
