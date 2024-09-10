package com.lec.ex;
// 국어, 영어, 수학 점수를 할당하고, 각 점수와 총점을 입력
public class Example {
	public static void main(String[] args) {
	int kor = 50;
	int eng = 35;
	int mat = 22;
	int tot = kor+eng+mat;
	System.out.println("국어 = " +kor +"점");
	System.out.println("영어 = " +eng +"점");
	System.out.println("수학 = " +mat +"점");
	double avg = (double)tot / 3;
	System.out.printf("총점 = %d\t 평균 = %.2f\n", tot, avg);
	} 

}
