package com.lec.ex07_customer;
public class TestMain {
	public static void main(String[] args) {
		Customer customer = new Customer("홍길동", "010-9999-9999", "서울", "01-01");
		customer.buy(1000000);
		System.out.println("===================");
		customer.buy(1000000);
		Staff staff = new Staff("홍사원", "010-8888-8888", "개발");
		Person[] person = {customer, staff};
		for	(Person p : person) {
			System.out.println(p.infoString());
		}
	}
}
