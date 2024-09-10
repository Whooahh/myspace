package com.lec.ex1_store;
//HeadQuarterStore를 상속받은 측에서 반드시 override 하도록
// 추상클래스 : 추상메소드가 0개 이상
public abstract class HeadQuarterStore {
	private String storeName;
	public HeadQuarterStore(String storeName) {this.storeName = storeName;}
	
	// 추상메소드 : 메소드 선언만 있고, 구현은 없는 메소드(구현은 상속받은 측에서)
	public abstract void kimchi();
	public abstract void bude();
	public abstract void bibim();
	public abstract void sunde();
	public abstract void gongi();
	public String getStoreName() {
		return storeName;		
	}
	public String toString() {
		return "★" + storeName + "★";
	}
		
}

