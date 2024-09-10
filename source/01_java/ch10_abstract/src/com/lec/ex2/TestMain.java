package com.lec.ex2;

public class TestMain {
	public static void main(String[] args) {
		//SuperClass obj = new SuperClass();
		SuperClass obj = new SuperClass() { //method2, method3은 SuperClass의 것으로			
			public void method1() {
				System.out.println("익명클래스의 method1");
			}
		};
		obj.method1();
		obj.method2();
		obj.method3();
		SuperClass obj1 = new ChildClass();
		obj1.method1();
		obj1.method2();
		obj1.method3();
	}

}
