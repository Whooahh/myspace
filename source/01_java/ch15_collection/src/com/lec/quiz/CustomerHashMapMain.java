package com.lec.quiz;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;
public class CustomerHashMapMain {
	public static void main(String[] args) {
		HashMap<String, Customer> customers = new HashMap<String, Customer>();	
		Scanner scanner = new Scanner(System.in);
		String answer = null, name, tel, address;
		while(true) {
			System.out.println("회원가입을 하시겠습니까? (Y/N)");
			answer = scanner.next();
			if (answer.equalsIgnoreCase("y")) {
				System.out.print("이름은?");
				name = scanner.next();
				System.out.print("전화?");
				tel = scanner.next();
				System.out.print("주소?");
				scanner.nextLine(); // 버퍼 지우기
				address = scanner.nextLine();
				customers.put(tel, new Customer(name, tel, address));
			}else if(answer.equalsIgnoreCase("n")) {
				break;
			}
		
		}//while
		scanner.close();
		// N(n)을 입력할 경우 회원정보 출력
//		if(customers.isEmpty()) {
		if(customers.size()==0) {
			System.out.println("가입한 회원 목록이 없습니다");
		}else {
			System.out.println("가입한 회원 목록입니다");
			Iterator<String> iterator = customers.keySet().iterator();
			while(iterator.hasNext()) {
				String key = iterator.next();
				System.out.println(customers.get(key));
			}
		}
	}//if
}