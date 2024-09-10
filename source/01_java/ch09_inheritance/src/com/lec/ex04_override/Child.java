package com.lec.ex04_override;

public class Child extends Parent {
	public Child() {
		System.out.println("매개변수 없는 Child 생성자");
		
	}
	public Child(int i) {
		System.out.println("매개변수 있는 Child 생성자");
	}
	public void method1() {
		System.out.println("Child의 method1()");
	}
	public void method2() {
		System.out.println("Child의 method2()");
	}public void method3() {
		System.out.println("Child의 method3()");
	}
}
