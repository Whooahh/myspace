package com.lec.ex3_Static;

public class MomTestMain {
	public static void main(String[] args) {
		
		Child child1 = new Child("첫째 길동이");
		Child child2 = new Child("첫째 길순이");
		Child child3 = new Child("첫째 개똥이");
		System.out.println("첫째 엄마 지갑 : " + child1.mom.money);
		child1.takeMoney(1000);
		child2.takeMoney(1000);
		child3.takeMoney(1000);
		System.out.println("첫째 엄마 지갑 : " + child1.mom.money);
		System.out.println("둘째 엄마 지갑 : " + child2.mom.money);
		System.out.println("셋째 엄마 지갑 : " + child3.mom.money);
	}
}
