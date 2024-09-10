
package com.lec.ex1_trycatch;
import java.util.Scanner;
public class Ex02 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("첫번째 정수는 ");
		int i = scanner.nextInt(); // InputMismatchException
		System.out.print("두번째 정수는 ");
		int j = scanner.nextInt(); // InputMismatchException
		try {
			System.out.println("i/j = " + (i/j));//예외가 발생할 수도 있는 부분
		}catch(ArithmeticException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("i*j = " + (i*j));
		System.out.println("i+j = " + (i+j));
		System.out.println("i-j = " + (i-j));
		scanner.close();
	}
}
