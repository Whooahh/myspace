package com.lec.quiz;
import java.util.Scanner;
// 입력한 수가 짝수인지 홀수인지 출력
public class Quiz1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("정수를 입력하시오 > ");
		int i = sc.nextInt();
		String result = (i%2 == 0) ? "짝수입니다" : "홀수입니다";
		System.out.println("입력하신 수 " + i + "는(은) " + result);
		System.out.printf("입력하신 수 %d는(은) %s", i, result);
	}

}
