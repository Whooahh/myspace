package com.lec.ex8_store;

public class StoreMain {
	public static void main(String[] args) {
		HeadQuarterStore[] stores = {
				new HeadQuarterStore("= = 본 사 = ="),
				new Store1("= = 주 택 가 1 호 점 = ="),
				new Store2("= = 대 학 가 2 호 점 = ="),
				new Store3("= = 증 권 가 3 호 점 = =")
		};
		for (int idx=0 ; idx<stores.length ; idx++) {
			System.out.println(stores[idx]);
			stores[idx].kimchi();
			stores[idx].bude();
			stores[idx].bibim();
			stores[idx].sunde();
			stores[idx].gongi();
		}// 일반 for
		// 위의 일반 for 문을 확정 for 문으로 수정해 보세요
		for(HeadQuarterStore store : stores) {
			System.out.println(store);
			store.kimchi();
			store.bude();
			store.bibim();
			store.sunde();
			store.gongi();
		}
		
//		HeadQuarterStore head = new HeadQuarterStore ("= = 본 사 = =");
//		Store1 st1 = new Store1("= = 주 택 가 1 호 점 = =");
//		Store2 st2 = new Store2("= = 대 학 가 2 호 점 = =");
//		Store3 st3 = new Store3("= = 증 권 가 3 호 점 = =");
//		HeadQuarterStore[] stores = {head, st1, st2, st3};
	}
}
