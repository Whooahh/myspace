package com.lec.ex;

public class Ex02arrayPrint {
	public static void main(String[] args) {
		int[] arr = {0, 0, 0};
		// 확장 for을 이용한 출력
		for(int a : arr) {
			System.out.println(a);
		}
		// 일반 for문을 이용한 배열값 변경
		for(int temp: arr) {
			temp=55;
		}
		System.out.println("확장 for문을 이용한 배열값 변경 후");
		for(int a: arr) {
			System.out.println(a);
		}
	}
	

}
