package com.lec.loop;
// 1~100까지의 숫자 중 3의 배수의 합을 출력
public class Ex09while {
	public static void main(String[] args) {
		int tot = 0; // 누적 변수
		int i = 1;
		while(i<=100) {
//			if(i%3 == 0) { // 3의 배수일 때만 누적
//				tot += i;				
//			}
			if(i%3 !=0) {
				i++;
				continue;
			}
			tot += i;
			i++;
		} //while
		System.out.println("1~100까지의 3의 배수의 합은 " +tot);
	}

}
