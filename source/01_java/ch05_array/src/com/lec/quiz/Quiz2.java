package com.lec.quiz;

import java.util.Scanner;

public class Quiz2 {
	public static void main(String[] args) {
        int[] arr = { 10, 20, 30, 40, 50, 12, 13};
        int tot = 0;
        int max=arr [0], min=arr[0];
        for(int idx=0 ; idx<arr.length ; idx++) {
        	tot += arr[idx];
        	if(arr[idx] > max) {
        		max = arr[idx];
        	}
        	if(arr[idx] < min) {
        		min = arr[idx];
        	}
        double avg = (double)tot / arr.length;
        System.out.println("합계 : " + tot);
        System.out.println("평균 : " + avg);
        System.out.println("최대값 : " +max);
        System.out.println("최소값 : " +min);
        }
	  }
   }

