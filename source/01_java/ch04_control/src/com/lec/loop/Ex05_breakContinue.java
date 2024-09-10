package com.lec.loop;
public class Ex05_breakContinue {
	public static void main(String[] args) {
		for(int i=1 ; i<=10 ; i++) {
			if(i==3) {
				//break; // 반복 for문을 빠져나가는 명령어
				continue;
			}
			System.out.println(i+ "\t");
		}
	}
}
