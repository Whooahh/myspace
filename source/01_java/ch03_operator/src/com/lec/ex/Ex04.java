package com.lec.ex;
// 논리연산자 : &&(and), || (or), !
public class Ex04 {
	public static void main(String[] args) {
		int i=1, j=10, h=10;
		System.out.println(" (i<j) && (++j>h) =>" + ( (i<j) && (++j>h)));
		System.out.println("j = " + j);
		// &&(and) 연산의 좌항이 false인 경우, 우항을 보지도 않고 결과를 false
		System.out.println(" (i>j) && (++j>h) =>" + ( (i>j) && (++j>h)));
		System.out.println("j = " + j);
		// || (or) 연산의 좌항이 true인 경우, 우항을 보지도 않고 결과를 true
		System.out.println(" (i>j) || (++j>h) =>" + ( (i>j) || (++j>h)));
		System.out.println("j = " + j);
			}

	}
