package com.lec.conditionQuiz;

import java.util.Scanner;

public class Quiz3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("가위(0), 바위(1), 보(2)를 입력하세요 : ");
		int you = scanner.nextInt();
		
		if (you == 0) {
			System.out.println("가위");
		}else if(you == 1) {
			System.out.println("바귀");
		}else if(you == 2) {
			System.out.println("보");
		}else {
			System.out.println("떼끼");
		}
		System.exit(0);
	}
}
