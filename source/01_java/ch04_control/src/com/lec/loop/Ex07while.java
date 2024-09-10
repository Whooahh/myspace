package com.lec.loop;
// 10, 9, 8, ...
public class Ex07while {
	public static void main(String[] args) {
		int i=10;
		while(i>0) {
			System.out.println(i + "\t");
			i--;
			if(i < 0) break;
		}
		
//		for(int i=10 ; i>0 ; i--) {
//			System.out.println(i + "\t");
//		}
	}

}
