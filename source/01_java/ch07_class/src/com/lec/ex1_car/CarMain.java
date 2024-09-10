package com.lec.ex1_car;

public class CarMain {
	public static void main(String[] args) {
		Car myPorsche = new Car();
//		myPorsche.color = "보라";
		myPorsche.setColor("보라");
//		myPorsche.cc = 2400;
		myPorsche.setCc(2400);
		System.out.println(myPorsche.getColor() + "색 차량 배기량은 " + myPorsche.getCc() + " 차량 속도는 " + myPorsche.getSpeed());
		myPorsche.drive();
		myPorsche.park();
		myPorsche.race();
		System.out.println(myPorsche.getColor() + "색 차량 배기량은 " + myPorsche.getCc() + " 차량 속도는 " + myPorsche.getSpeed());
		
		
		Car yourPorsche = new Car();
//		yourPorsche.color = "빨강";
		yourPorsche.setColor("빨강");
//		yourPorsche.cc = 2200;
		yourPorsche.setCc(2200);
		System.out.println(yourPorsche.getColor() + "색 차량 배기량은 " + yourPorsche.getCc() + " 차량 속도는 " + yourPorsche.getSpeed());
		yourPorsche.drive();
		yourPorsche.park();
		yourPorsche.race();
		System.out.println(yourPorsche.getColor() + "색 차량 배기량은 " + yourPorsche.getCc() + " 차량 속도는 " + yourPorsche.getSpeed());
				
		
	}

}
