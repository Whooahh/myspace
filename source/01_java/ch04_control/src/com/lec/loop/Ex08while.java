package com.lec.loop;
// 1~10까지의 누적합을 출력
public class Ex08while {
	public static void main(String[] args) {
		int i = 1;
		int tot = 0;
		while( ++i<=10) {
			tot += i; //tot= tot+i
			System.out.printf("i가 %d일때까지의 누적합은 %d\n", i, tot);
		}
	}
}
