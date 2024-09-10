package com.lec.ex2_store;
//김치찌개-8,000  부대찌개-8,000  비빔밥-9,000 순대국-안팔아 공기밥-1,000원
public class Store1 implements HeadQuarterStore {
	private String storeName;
	public Store1(String storeName) {
		this.storeName = storeName;
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
		return "★" + storeName + "★"; 
	}
}
