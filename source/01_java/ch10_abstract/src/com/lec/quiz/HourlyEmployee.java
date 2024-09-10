package com.lec.quiz;

// name, annalSalary, computePay(),computeIncentive()
public class HourlyEmployee extends Employee {
	private int hoursWorked;
	private int moneyPerHour;

	public HourlyEmployee(String name, int hoursWorked, int moneyPerHour) {
		super(name);
		this.hoursWorked = hoursWorked;
		this.moneyPerHour = moneyPerHour;
	}

	public int computePay() {
		return hoursWorked * moneyPerHour;
	}

}
