package com.lec.ex5_final;
// final 변수 : 수정 불가
public class FinalTest {
	public static void main(String[] args) {
		final double PI = 3.141592;
		double r = 3;
		r = 5;
		double area = r* r * PI;
		System.out.println(area);
	}
}
