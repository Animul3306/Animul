package com.multi.animul.retrieve;

public class InsuranceVO {
	private String insurance_subscription;
	private String insurance_period;
	private String insurance_limit;
	private String insurance_reward;
	private String insurance_surgery;
	private String insurance_self;
	private String insurance_disclaimer;
	private String insurance_Schadenersatz;
	private String insurance_discount;
	public String getInsurance_subscription() {
		return insurance_subscription;
	}
	public void setInsurance_subscription(String insurance_subscription) {
		this.insurance_subscription = insurance_subscription;
	}
	public String getInsurance_period() {
		return insurance_period;
	}
	public void setInsurance_period(String insurance_period) {
		this.insurance_period = insurance_period;
	}
	public String getInsurance_limit() {
		return insurance_limit;
	}
	public void setInsurance_limit(String insurance_limit) {
		this.insurance_limit = insurance_limit;
	}
	public String getInsurance_reward() {
		return insurance_reward;
	}
	public void setInsurance_reward(String insurance_reward) {
		this.insurance_reward = insurance_reward;
	}
	public String getInsurance_surgery() {
		return insurance_surgery;
	}
	public void setInsurance_surgery(String insurance_surgery) {
		this.insurance_surgery = insurance_surgery;
	}
	public String getInsurance_self() {
		return insurance_self;
	}
	public void setInsurance_self(String insurance_self) {
		this.insurance_self = insurance_self;
	}
	public String getInsurance_disclaimer() {
		return insurance_disclaimer;
	}
	public void setInsurance_disclaimer(String insurance_disclaimer) {
		this.insurance_disclaimer = insurance_disclaimer;
	}
	public String getInsurance_Schadenersatz() {
		return insurance_Schadenersatz;
	}
	public void setInsurance_Schadenersatz(String insurance_Schadenersatz) {
		this.insurance_Schadenersatz = insurance_Schadenersatz;
	}
	public String getInsurance_discount() {
		return insurance_discount;
	}
	public void setInsurance_discount(String insurance_discount) {
		this.insurance_discount = insurance_discount;
	}
	@Override
	public String toString() {
		return "InsuranceVO [insurance_subscription=" + insurance_subscription + ", insurance_period="
				+ insurance_period + ", insurance_limit=" + insurance_limit + ", insurance_reward=" + insurance_reward
				+ ", insurance_surgery=" + insurance_surgery + ", insurance_self=" + insurance_self
				+ ", insurance_disclaimer=" + insurance_disclaimer + ", insurance_Schadenersatz="
				+ insurance_Schadenersatz + ", insurance_discount=" + insurance_discount + "]";
	}
	
}
