package com.lec.quiz;
//name, annualSalary, computePay(),computeIncentive()
public class SalaryEmployee extends Employee{
	private int annualSalary;
	public SalaryEmployee(String name, int annualSalary) {
		super(name);
		this.annualSalary = annualSalary;
	}
	public int computePay() {
		return annualSalary / 14;
	}
	

}
