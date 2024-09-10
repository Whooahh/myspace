package com.lec.conditionQuiz;
import java.util.Scanner;
// 현재 몇월인지 키보드로 입력받아 계절을 출력하는 프로그램을 구현하세요
public class Quiz5_weather {
	public static void main(String[] args) {
		//사용자로부터 두 수 입력받기
		Scanner sc = new Scanner(System.in);
		System.out.print("몇 월인지 입력하세요 > ");
		int mon = sc.nextInt();

		if (mon >=3 && mon <=5) {
			System.out.printf("봄입니다");
		}else if(mon >=6 && mon <=8) {
			System.out.printf("여름입니다");
		}else if(mon >=9 && mon <=11) {
			System.out.println("가을입니다");
		}else if(mon == 12 || mon == 1 || mon ==2) {
			System.out.println("겨울입니다");
		}else {
			System.out.println("잘못 입력하셨습니다");
		}
		sc.close();
	}
}
