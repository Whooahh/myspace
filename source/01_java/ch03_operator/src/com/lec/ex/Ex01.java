package com.lec.ex;
// 산술 연산자 : + - * / % (나머지 연산자)
public class Ex01 {
	public static void main(String[] args) {
		int n1=33, n2=10;
		int result;
		double resultDouble;
		result = n1 + n2;
		System.out.printf("%d %c %d = %d\n", n1, '+', n2, n1+n2);			
		result = n1 - n2;
		System.out.printf("%d %c %d = %d\n", n1, '-', n2, n1-n2);
		result = n1 * n2;
		System.out.printf("%d %c %d = %d\n", n1, '*', n2, n1*n2);
		resultDouble = n1 / n2;
		System.out.printf("%d %c %d = %d\n", n1, '/', n2, result);	
		System.out.printf("%d %c %d = %f\n", n1, '/', n2, resultDouble);
		// 나머지 연산자의 용도 : 짝홀수 판별, n의 배수 판별
		if(n1%2 == 0) {
			System.out.println("n1은 짝수입니다");
		}else {
			System.out.println("n1은 홀수입니다");
		}
		if(n1%5 == 0) {
			System.out.println("n1은 5의 배수입니다");
		}else {
			System.out.println("n1은 5의 배수가 아닙니다");
		}
	}

}
