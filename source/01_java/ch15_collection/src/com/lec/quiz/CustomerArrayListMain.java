package com.lec.quiz;
import java.util.ArrayList;
import java.util.Scanner;
public class CustomerArrayListMain {
	public static void main(String[] args) {
		ArrayList<Customer> customers = new ArrayList<Customer>();
		Scanner scanner = new Scanner(System.in);
		String answer = null, name, tel, address;
		do {
			System.out.println("회원가입을 하시겠습니까? (Y/N)");
			answer = scanner.nextLine();
			if (answer.equalsIgnoreCase("y")) {
				Customer newCustomer = new Customer();
				System.out.print("이름은? ");
				newCustomer.setName(scanner.next());
				System.out.print("전화번호는? ");
				scanner.nextLine();
				newCustomer.setTel(scanner.next());
				System.out.print("주소는? ");
				scanner.nextLine();
				newCustomer.setAddress(scanner.next());
				customers.add(newCustomer);	
			}
		}while(!answer.equalsIgnoreCase("n"));
		scanner.close();
	if(customers.size()==0) {
		System.out.println("가입한 회원 목록이 없습니다");
	}else {
		System.out.println("가입한 회원 목록입니다.");
		for(Customer customer : customers) {
			System.out.println(customer);
			}
		}
	}
}
