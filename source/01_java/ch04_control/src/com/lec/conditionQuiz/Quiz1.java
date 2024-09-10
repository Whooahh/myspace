package com.lec.conditionQuiz;

import java.util.Scanner;

public class Quiz1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("정수를 입력하시오 : ");
		int i = sc.nextInt();
		
		if (i>=0) {
			System.out.printf("입력하신 수의 절대값은 : %d\n", i);
		}else {
			System.out.printf("입력하신 수의 절대값은 : %d\n", -i);
	}
	sc.close();	
  }
}
