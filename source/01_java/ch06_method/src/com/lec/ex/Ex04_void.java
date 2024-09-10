package com.lec.ex;
// return 이 없는 메소드의 타입을 void로
public class Ex04_void {
	public static void main(String[] args) {
		printLine(30);
		System.out.println("Hello World");
		printLine("=");
		System.out.println("Hello, Java");
		printLine(30, "~");
		System.out.println("Hello, World");
		printLine();
	}
	private static void printLine(int cnt, String ch) {
		for(int i=0 ; i<cnt ; i++) {
			System.out.print(ch);
		}
		System.out.println();
	}
	
	private static void printLine(String ch) {
		for(int i=0 ; i<20 ; i++) {
			System.out.print(ch);
		}
		System.out.println();
	}
		
	private static void printLine(int cnt) {
		for(int i=0 ; i<cnt ; i++) {
			System.out.print('-');
		}
		System.out.println();
		
	}
	private static void printLine() {
		for(int i=0 ; i<20 ; i++) {
			System.out.print('-');	
		}
		System.out.println(); // 개행
	}
}
