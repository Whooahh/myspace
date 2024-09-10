package com.lec.ex4_actor;
// 다형식 ex
public class ActorMain {
	public static void main(String[] args) {
		Actor park = new Actor("박보검");
		park.canCatchCriminal();
		park.canSearch();
		park.makePizza();
		park.makeSpaghetti();
		park.outFire();
		park.saveMan();
		IPoliceMan policePark = park;
//		policePark.canCatchCriminal();
//		policePark.canSearch();
//		policePark.makePizza();
//		policePark.makeSpaghetti();
//		policePark.outFire();
//		policePark.saveMan();
		IFireFighter fighterPark = park;
		fighterPark.outFire();
		fighterPark.saveMan();
		IChef chefPark = park;
		chefPark.makePizza();
		chefPark.makeSpaghetti();
	}
}
