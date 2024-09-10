package com.lec.ex2_map;
import java.util.HashMap;
import java.util.Iterator;
public class Ex01_HashMap {
	public static void main(String[] args) {
		HashMap<Integer, String> hashMap = new HashMap<Integer, String>();
		hashMap.put(11, "str11");
		hashMap.put(12, "str12");
		hashMap.put(22, "str22");
		hashMap.put(20, "str20");
		System.out.println(11 + "key값의 데이터 : " + hashMap.get(11));
		System.out.println(12 + "key값의 데이터 : " + hashMap.get(12));
		System.out.println(22 + "key값의 데이터 : " + hashMap.get(22));
		System.out.println(20 + "key값의 데이터 : " + hashMap.get(20));
		System.out.println(10 + "key값의 데이터(없으면 Null) : " + hashMap.get(10));
		System.out.println(hashMap);
		hashMap.remove(12); //remove시 key값으로 :ㅣ 12key값의 데이터 삭제
		System.out.println("12 remove 후 : " + hashMap);
		hashMap.clear();
		System.out.println(hashMap.isEmpty()? "데이터 없음" : "데이터 있음");
		//출력
		hashMap.put(0, "Hong GilDong");
		hashMap.put(10, "Kim DongIl");
		hashMap.put(22, "Lee Soonsin");
		hashMap.put(40, "Shin GilDong");
		Iterator<Integer> iterator = hashMap.keySet().iterator();
		while(iterator.hasNext()) {
			Integer key = iterator.next();
			System.out.println(key + "의 데이터는 " + hashMap.get(key));
		}
	}
}
