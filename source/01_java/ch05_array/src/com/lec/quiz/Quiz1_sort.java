package com.lec.quiz;
// 배열의 오름차순 정렬

import java.util.Arrays;

public class Quiz1_sort {
	public static void main(String[] args) {
		int[] arr = {76, 45, 34, 89, 50};
//		for(int a : arr) {
//			System.out.print(a + "\t");
//		}
		System.out.println("정렬 전 : " + Arrays.toString(arr));
		//정렬
		for(int i=0 ; i<arr.length-1 ; i++) {
			for(int j=i+1 ; j<arr.length ; j++) {
				if(arr[i] > arr[j]) {
					// i번째와 j번째 바꿔
					int temp = arr[i];
					arr[i] = arr[j];
					arr[j] = arr[i];
				}
			}
		}
		System.out.println("정렬 전 : " + Arrays.toString(arr));
	}

}
