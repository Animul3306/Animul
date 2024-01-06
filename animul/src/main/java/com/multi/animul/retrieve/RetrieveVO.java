package com.multi.animul.retrieve;

public class RetrieveVO {
	private String rd_animal;
	private String rd_retrievedisease;
	private String rd_result;
	private String rd_list;
	public String getRd_animal() {
		return rd_animal;
	}
	public void setRd_animal(String rd_animal) {
		this.rd_animal = rd_animal;
	}
	public String getRd_retrievedisease() {
		return rd_retrievedisease;
	}
	public void setRd_retrievedisease(String rd_retrievedisease) {
		this.rd_retrievedisease = rd_retrievedisease;
	}
	public String getRd_result() {
		return rd_result;
	}
	public void setRd_result(String rd_result) {
		this.rd_result = rd_result;
	}
	public String getRd_list() {
		return rd_list;
	}
	public void setRd_list(String rd_list) {
		this.rd_list = rd_list;
	}
	@Override
	public String toString() {
		return "RetrieveVO [rd_animal=" + rd_animal + ", rd_retrievedisease=" + rd_retrievedisease + ", rd_result="
				+ rd_result + ", rd_list=" + rd_list + "]";
	}

}
