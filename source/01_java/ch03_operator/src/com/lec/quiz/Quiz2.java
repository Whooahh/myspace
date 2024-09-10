package com.lec.quiz;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;
// 국어, 영어, 수학 점수를 사용자에게 입력받아, 각 점수를 출력하고 총점, 평균(소수점2자리까지) 출력하는 프로그램을 구현 하시오

public class Quiz2 {
	public static void main(String[] args) throws IOException{
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);
		
		String strName;
		int nKor, nEng, nMat;
		int nTot;
		
		System.out.print("이름을 입력하시오 > ");
		strName = br.readLine();
		
		System.out.print("국어 점수 입력 > ");
		nKor = Integer.parseInt(br.readLine());
		
		System.out.print("영어 점수 입력 > ");
		nEng = Integer.parseInt(br.readLine());
		
		System.out.print("수학 점수 입력 > ");
		nMat = Integer.parseInt(br.readLine());
		
		nTot = nKor + nEng + nMat;
		
		double avg = nTot / 3;
		
		System.out.printf("이름 : %s\n", strName);
		System.out.printf("총점 : %d\n", nTot);
		System.out.printf("평균 = %.2f\n", avg);
		
		
	}
}
