package com.lec.loop;

import java.util.Scanner;
// 짝수를 입력받아 출력
public class Ex10doWhile {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int num;
		do {
			System.out.print("짝수를 입력하세요 > ");
			num = sc.nextInt();
		}while(num%2 !=0);
		System.out.println("입력하신 짝수는 > " + num);
		sc.close();
	}
}
