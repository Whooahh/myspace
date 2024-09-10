package com.lec.ex3_Static;
// new Child("첫째")
public class Child {
	private String name;
	Mom mom;
	public Child(String name) {
		this.name = name;
		mom = new Mom();
	}
	public void takeMoney(int money) {
		if(mom.money >= money) {
			mom.money -= money;
			System.out.println(name + "가 " + money + "원 가져가서 엄마 지갑엔 " + mom.money);
		}else {
			System.out.println(name + "가 돈 못 받음, 현재 엄마 지갑엔" + mom.money);
		}
	}
}
