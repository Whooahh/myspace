package com.lec.loopQuiz;

import java.util.Scanner;

// 사용자로부터 원하는 구구단 숫자를 입력받아 출력
public class Quiz3_gugudan {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("몇 단의 구구단을 출력하실 건가요 > ");
		int dansu = sc.nextInt();
		for(int i=1 ; i<=9 ; i++) {
			System.out.println(dansu + " * " + i + " = " + dansu*i);
		}
		sc.close();
	}

}

