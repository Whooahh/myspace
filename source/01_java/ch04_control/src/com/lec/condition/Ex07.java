package com.lec.condition;
// 입력받은 수가 홀수인지 짝수인지 출력(if,switch,삼항연산자)
import java.util.Scanner;
public class Ex07 {
	public static void main(String[] args) {
		//사용자로부터 두 수 입력받기
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("정수를 입력하시오 > ");
		int num = scanner.nextInt();
		
//		if (num%2==0) {
//			System.out.printf("짝수입니다");
//		}else{
//			System.out.printf("홀수입니다");
//		}
		System.out.println( num%2==0 ? "짝수" : "홀수");
		switch(num%2) {
		case 0 :
			System.out.println("짝수"); break;
		default :
			System.out.println("홀수"); break;		
		}
	}
}
