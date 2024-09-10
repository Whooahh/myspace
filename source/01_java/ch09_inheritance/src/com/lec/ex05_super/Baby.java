package com.lec.ex05_super;
//super() : 부모클래스의 생성자 함수
//super.intro() : 부모클래스의 intro()

public class Baby extends Person {
	public Baby() {
		super();
		System.out.println("매개변수 없는 Baby 생성자");
	}
	public Baby(String name, String character) {
		super(name, character);
		System.out.println("매개변수 있는 Baby 생성자"); // 부모클래스의 매개변수 있는 생성자 함수, 반드시 첫번째 줄에 호출
//		setName(name);
//		setCharacter(character);
	}
	public void intro() {
		System.out.print("◑◐ 응애");
		super.intro();
	}

}
