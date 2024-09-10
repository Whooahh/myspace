package com.lec.ex1_store;
// 김치찌개-8,000  부대찌개-8,000(o)  비빔밥-8,000(o) 순대국-8,000  공기밥-무료(o)
public class Store2 extends HeadQuarterStore {
	public Store2(String storeName) {
		super(storeName);
		
	}
	public void kimchi(){
		System.out.println("김치찌개 : 8000원");
	}
	public void bude() {
		System.out.println("부대찌개 : 8000원");
	}
	public void bibim() {	
		System.out.println("비빔밥 : 9000원");
	}
	public void sunde() {
		System.out.println("순대국은 안 팔아요");
	}
	public void gongi() {
		System.out.println("공기밥 : 1000원");
	}
	public String toString() {
		return "★" + getStoreName() + "★"; 
	}
}