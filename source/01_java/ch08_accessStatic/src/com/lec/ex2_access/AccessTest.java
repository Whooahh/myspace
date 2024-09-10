package com.lec.ex2_access;

public class AccessTest {
	private int privateMember; // 같은 클래스 내에서만 사용가능
	public int defaultMember; // 디폴트 접근 제한
	public int protectedMember; // 같은 패키지나 상속받은 클래스 에서만 사용가능
	public int publicMember; //아무데서나 사용가능
	
	private void privateMethod() {
		System.out.println("private 메소드");
	}
	void defaultMethod() {
		System.out.println("default  메스도");
	}
	public void protectedMethod() {
		System.out.println("protected 메소드");
	}
	public void publicMethod() {
		System.out.println("public 메소드");
	}

}
