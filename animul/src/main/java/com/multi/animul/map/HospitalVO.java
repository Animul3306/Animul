package com.multi.animul.map;

public class HospitalVO {

	private int 	hospital_id;
	private String 	hospital_name;
	private String 	hospital_address;
	private int 	hospital_zipcode;
	private String  hospital_phone;
	private int 	hospital_type;
	private String	hospital_link;
	private String	hosptial_picture;
	
	public int getHospital_id() {
		return hospital_id;
	}
	public void setHospital_id(int hospital_id) {
		this.hospital_id = hospital_id;
	}
	public String getHospital_name() {
		return hospital_name;
	}
	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}
	public String getHospital_address() {
		return hospital_address;
	}
	public void setHospital_address(String hospital_address) {
		this.hospital_address = hospital_address;
	}
	public int getHospital_zipcode() {
		return hospital_zipcode;
	}
	public void setHospital_zipcode(int hospital_zipcode) {
		this.hospital_zipcode = hospital_zipcode;
	}
	public String getHospital_phone() {
		return hospital_phone;
	}
	public void setHospital_phone(String hospital_phone) {
		this.hospital_phone = hospital_phone;
	}
	public int getHospital_type() {
		return hospital_type;
	}
	public void setHospital_type(int hospital_type) {
		this.hospital_type = hospital_type;
	}
	public String getHospital_link() {
		return hospital_link;
	}
	public void setHospital_link(String hospital_link) {
		this.hospital_link = hospital_link;
	}
	public String getHosptial_picture() {
		return hosptial_picture;
	}
	public void setHosptial_picture(String hosptial_picture) {
		this.hosptial_picture = hosptial_picture;
	}
	
	@Override
	public String toString() {
		return "HospitalVO [hospital_id=" + hospital_id + ", hospital_name=" + hospital_name + ", hospital_address="
				+ hospital_address + ", hospital_zipcode=" + hospital_zipcode + ", hospital_phone=" + hospital_phone
				+ ", hospital_type=" + hospital_type + ", hospital_link=" + hospital_link + ", hosptial_picture="
				+ hosptial_picture + "]";
	}
	
	
	
}
