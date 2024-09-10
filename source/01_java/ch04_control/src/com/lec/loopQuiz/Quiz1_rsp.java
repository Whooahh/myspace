	package com.lec.loopQuiz;
	
	import java.util.Scanner;

	public class Quiz1_rsp {
	public static void main(String[] args) {
		System.out.print("가위(0), 바위(1), 보(2) 입력 (종료는 -1) : ");
		Scanner sc = new Scanner(System.in);
	do {
		int you = sc.nextInt();
		
		if (you< 0 || you > 2) {
			System.out.println("가위 바위 보 중 하나를 다음엔 잘 내요");
			continue;
		}
		System.out.print("가위(0),바위(1),보(2) 입력 : ");
		int you1 = sc.nextInt();
		if (you1 < 0 || you1 > 2) {
			System.out.println("떼끼");
			System.exit(0); // 프로그램 정상 강제 종료
		}
		String youStr = (you1 == 0) ? "가위" : (you1 == 1) ? "바위" : "보";
		
		// 컴퓨터도 0~2 난수 0 <= Math.random()*3 < 3
		int com = (int) (Math.random() * 3);
		String comStr = (com == 0) ? "가위" : (com == 1) ? "바위" : "보";
		System.out.println("당신은 " + youStr + ", 컴퓨터는 " + comStr);
		// if문이나 switch문 이용해서 가위바위보 결과 출력
		// 당신이 이겼습니다 || 컴퓨터가 이겼습니다 || 비겼습니다 출력
		if (you1 == com) {
			System.out.println("비겼습니다 -.-");
		} else if (you1 == 0) {
			if (com == 1) {
				System.out.println("컴퓨터가 이겼습니다 ㅠㅠ"); break;
			} else {
				System.out.println("★ 당신이 이겼습니다 ★");
			}
		} else if (you1 == 1) {
			if (com == 0) {
				System.out.println("★ 당신이 이겼습니다 ★");
			} else {
				System.out.println("컴퓨터가 이겼습니다 ㅠㅠ");
			}
		} else if (you1 == 2) {
			if (com == 0) {
				System.out.println("컴퓨터가 이겼습니다 ㅠㅠ");
			} else {
				System.out.println("★ 당신이 이겼습니다 ★");
			}
		} // 결과

	}while(true); // do-while
	}
	}