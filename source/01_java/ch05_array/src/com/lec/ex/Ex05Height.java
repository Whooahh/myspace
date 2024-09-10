package com.lec.ex;

import java.util.Scanner;
// 길동, 현식, 땅땅, 대갈 친구의 키를 입력받고, 평균, 최장신 친구의 이름과 키, 최단신 친구의 이름과 키
public class Ex05Height {
	public static void main(String[] args) {
		String[] names = {"길동", "현식", "땅땅", "슘당", "대갈"};
		int[] heights = new int[names.length];
		Scanner sc = new Scanner(System.in);
		int totHeight = 0; // 키 누적변수
		// 친구들 키 입력 받아 height 배열에 할당 후 키 누적 합
		for(int idx=0 ; idx<names.length ; idx++) {
			System.out.println(names[idx] + "의 키는?");
			heights[idx] = sc.nextInt();
			totHeight += heights[idx]; // 키 누적
		}//for
		// 친구들 키 입력
		for(int idx=0 ; idx<names.length ; idx++) {
			System.out.printf("%d번째 %s의 키는 %d\n", idx, names[idx], heights[idx]);
		}
		System.out.println("평균키 : " + (double)totHeight/names.length);
		//
		int maxHeight=heights[0], maxIdx = 0;
		int minHeight=heights[0], minIdx = 0;
		for(int idx=0 ; idx<names.length ; idx++) {
			if(heights[idx] > maxHeight) {
				maxHeight = heights[idx];
				maxIdx = idx;
			}// if 최대값 
			if(heights[idx] < minHeight) {
				minHeight = heights[idx];
				minIdx = idx;
			}// for
		}
		System.out.printf("최장신 %s의 키는 %d\n", names[maxIdx], maxHeight);
		System.out.printf("최단신 %s의 키는 %d\n", names[minIdx], minHeight);
	}

}
