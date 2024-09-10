package com.lec.ex03_abc;

public class ABCTestMain {
	public static void main(String[] args) {
		S sobj = new S(); // 생성자 1개 실행
		//A aobj = new A(); // 생성자 2개 실생 (S,A)
		S aobj = new A(); // 생성자 2개 실생 (S,A)
		B bobj = new B(); // 생성자 2개 실생 (S,A)
		C cobj = new C(); // 생성자 3개 실생 (S,A,C)
		S[] arr = {sobj, aobj, bobj, cobj, new A()};
		for(S temp : arr) {
			System.out.println(temp.s);
		}
	}
}
