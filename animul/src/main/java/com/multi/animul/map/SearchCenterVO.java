package com.multi.animul.map;

public class SearchCenterVO {

	private int 	searchCenter_id;
	private String 	searchCenter_name;
	private String 	searchCenter_address;
	private int 	searchCenter_zipcode;
	private String  searchCenter_phone;
	private int 	searchCenter_type;
	private String	searchCenter_link;
	private String	searchCenter_picture;
	private String	searchCenter_time;
	private String  searchCenter_off;
	private double  searchCenter_latitude;
	private double  searchCenter_longitude;
	
	public int getSearchCenter_id() {
		return searchCenter_id;
	}
	public void setSearchCenter_id(int searchCenter_id) {
		this.searchCenter_id = searchCenter_id;
	}
	public String getSearchCenter_name() {
		return searchCenter_name;
	}
	public void setSearchCenter_name(String searchCenter_name) {
		this.searchCenter_name = searchCenter_name;
	}
	public String getSearchCenter_address() {
		return searchCenter_address;
	}
	public void setSearchCenter_address(String searchCenter_address) {
		this.searchCenter_address = searchCenter_address;
	}
	public int getSearchCenter_zipcode() {
		return searchCenter_zipcode;
	}
	public void setSearchCenter_zipcode(int searchCenter_zipcode) {
		this.searchCenter_zipcode = searchCenter_zipcode;
	}
	public String getSearchCenter_phone() {
		return searchCenter_phone;
	}
	public void setSearchCenter_phone(String searchCenter_phone) {
		this.searchCenter_phone = searchCenter_phone;
	}
	public int getSearchCenter_type() {
		return searchCenter_type;
	}
	public void setSearchCenter_type(int searchCenter_type) {
		this.searchCenter_type = searchCenter_type;
	}
	public String getSearchCenter_link() {
		return searchCenter_link;
	}
	public void setSearchCenter_link(String searchCenter_link) {
		this.searchCenter_link = searchCenter_link;
	}
	public String getSearchCenter_picture() {
		return searchCenter_picture;
	}
	public void setSearchCenter_picture(String searchCenter_picture) {
		this.searchCenter_picture = searchCenter_picture;
	}
	public String getSearchCenter_time() {
		return searchCenter_time;
	}
	public void setSearchCenter_time(String searchCenter_time) {
		this.searchCenter_time = searchCenter_time;
	}
	public String getSearchCenter_off() {
		return searchCenter_off;
	}
	public void setSearchCenter_off(String searchCenter_off) {
		this.searchCenter_off = searchCenter_off;
	}
	public double getSearchCenter_latitude() {
		return searchCenter_latitude;
	}
	public void setSearchCenter_latitude(double searchCenter_latitude) {
		this.searchCenter_latitude = searchCenter_latitude;
	}
	public double getSearchCenter_longitude() {
		return searchCenter_longitude;
	}
	public void setSearchCenter_longitude(double searchCenter_longitude) {
		this.searchCenter_longitude = searchCenter_longitude;
	}
	@Override
	public String toString() {
		return "SearchCenterVO [searchCenter_id=" + searchCenter_id + ", searchCenter_name=" + searchCenter_name
				+ ", searchCenter_address=" + searchCenter_address + ", searchCenter_zipcode=" + searchCenter_zipcode
				+ ", searchCenter_phone=" + searchCenter_phone + ", searchCenter_type=" + searchCenter_type
				+ ", searchCenter_link=" + searchCenter_link + ", searchCenter_picture=" + searchCenter_picture
				+ ", searchCenter_time=" + searchCenter_time + ", searchCenter_off=" + searchCenter_off
				+ ", searchCenter_latitude=" + searchCenter_latitude + ", searchCenter_longitude="
				+ searchCenter_longitude + "]";
	}
 
}
