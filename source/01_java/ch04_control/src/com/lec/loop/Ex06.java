package com.lec.loop;
// loop문을 작성할 때에는 무한 loop에 빠지지 않도록 조심
public class Ex06 {
	public static void main(String[] args) {
		for (int i=1 ; ;i++) {
			System.out.println(i + ", 안녕");	
			if(i==10) break;
		}
		System.out.println("실행 안 됨");
	}

}
