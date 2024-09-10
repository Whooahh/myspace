package com.lec.ex04_override;

public class TestMain {
	public static void main(String[] args) {
		Parent pObj1 = new Parent();
		Parent pObj2 = new Parent();
		System.out.println("pObj1과 pObj2가 같은지 ? " + (pObj1.equals(pObj2)));
		pObj1.method1();
		pObj2.method2();
		Child cObj1 = new Child();
		Child cObj2 = new Child();
		System.out.println("cObj1과 cObj2가 같은지 ? " + (cObj1.equals(cObj2)));
		cObj1.method1();
		cObj1.method2();
		cObj1.method3();
		Parent obj = new Child();
		obj.method1();
		obj.method2();
		//((Child)obj).method3();
		if(obj instanceof Child) { //obj가 Child형 인스턴스 변수냐
			((Child)obj).method3();			
		}else {
			System.out.println("형 변환 불가");
			
		}
	}
}
