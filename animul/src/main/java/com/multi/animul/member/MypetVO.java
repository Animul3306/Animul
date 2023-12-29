package com.multi.animul.member;

public class MypetVO {
	private int mypet_id;
	private String mypet_owner;
	private String mypet_name;
	private String mypet_category;
	private String mypet_variery;
	private String mypet_gender;
	private String mypet_image;
	private double mypet_weight;
	private String mypet_birthday;
	private boolean	is_neutralization;
	
	public int getMypet_id() {
		return mypet_id;
	}
	public void setMypet_id(int mypet_id) {
		this.mypet_id = mypet_id;
	}
	public String getMypet_owner() {
		return mypet_owner;
	}
	public void setMypet_owner(String mypet_owner) {
		this.mypet_owner = mypet_owner;
	}
	public String getMypet_name() {
		return mypet_name;
	}
	public void setMypet_name(String mypet_name) {
		this.mypet_name = mypet_name;
	}
	public String getMypet_category() {
		return mypet_category;
	}
	public void setMypet_category(String mypet_category) {
		this.mypet_category = mypet_category;
	}
	public String getMypet_variery() {
		return mypet_variery;
	}
	public void setMypet_variery(String mypet_variery) {
		this.mypet_variery = mypet_variery;
	}
	public String getMypet_gender() {
		return mypet_gender;
	}
	public void setMypet_gender(String mypet_gender) {
		this.mypet_gender = mypet_gender;
	}
	public String getMypet_image() {
		return mypet_image;
	}
	public void setMypet_image(String mypet_image) {
		this.mypet_image = mypet_image;
	}
	public double getMypet_weight() {
		return mypet_weight;
	}
	public void setMypet_weight(double mypet_weight) {
		this.mypet_weight = mypet_weight;
	}
	public String getMypet_birthday() {
		return mypet_birthday;
	}
	public void setMypet_birthday(String mypet_birthday) {
		this.mypet_birthday = mypet_birthday;
	}
	public boolean isIs_neutralization() {
		return is_neutralization;
	}
	public void setIs_neutralization(boolean is_neutralization) {
		this.is_neutralization = is_neutralization;
	}
	
	@Override
	public String toString() {
		return "MypetVO [mypet_id=" + mypet_id + ", mypet_owner=" + mypet_owner + ", mypet_name=" + mypet_name
				+ ", mypet_category=" + mypet_category + ", mypet_variery=" + mypet_variery + ", mypet_gender="
				+ mypet_gender + ", mypet_image=" + mypet_image + ", mypet_weight=" + mypet_weight + ", mypet_birthday="
				+ mypet_birthday + ", is_neutralization=" + is_neutralization + "]";
	}
}
