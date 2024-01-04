package com.multi.animul.member;

import java.sql.Date;

public class MemberVO {
	private String id;
	private String password;
	private String member_email;
	private String member_nickname;
	private String member_image;
	private Date member_birthday;
	private String member_gender;
	private int member_age;
	private String member_name;
	private boolean is_admin;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_image() {
		return member_image;
	}
	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}
	public Date getMember_birthday() {
		return member_birthday;
	}
	public void setMember_birthday(Date member_birthday) {
		this.member_birthday = member_birthday;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public int getMember_age() {
		return member_age;
	}
	public void setMember_age(int member_age) {
		this.member_age = member_age;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public boolean isIs_admin() {
		return is_admin;
	}
	public void setIs_admin(boolean is_admin) {
		this.is_admin = is_admin;
	}
	
	@Override
	public String toString() {
		return "memberVO [id=" + id + ", password=" + password + ", member_email=" + member_email + ", member_nickname="
				+ member_nickname + ", member_image=" + member_image + ", member_birthday=" + member_birthday
				+ ", member_gender=" + member_gender + ", member_age=" + member_age + ", member_name=" + member_name
				+ ", is_admin=" + is_admin + "]";
	}
}
